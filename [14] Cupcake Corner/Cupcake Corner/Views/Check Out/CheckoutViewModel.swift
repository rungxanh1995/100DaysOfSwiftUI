//
//  CheckoutViewModel.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-19.
//

import SwiftUI

extension CheckoutView {
	final class ViewModel: ObservableObject {
		@Published
		var order: Order
		
		private(set) var decorativeCupcakeImage: URL?

		@Published
		private(set) var confirmationMessage: String
		
		@Published
		private(set) var showingConfirmation: Bool
		
		init(order: Order) {
			self.order = order
			self.decorativeCupcakeImage = Constants.randomDecorativeCupcakeUrl
			confirmationMessage = ""
			showingConfirmation = false
		}
		
		func placeOrder() async -> Void {
			guard let encodedData = encodeOrderObject() else { return }
			let networkRequest = createAndConfigNetworkRequest()
			do {
				let confirmedOrder = try await fetch(networkRequest, from: encodedData)
				updateConfirmationContent(from: confirmedOrder)
			} catch {
				updateConfirmationContentForFailure()
			}
		}
		
		/// Convert current order object into some JSON data that can be sent
		private func encodeOrderObject() -> Data? {
			if let encoded = try? JSONEncoder().encode(self.order) {
				return encoded
			}
			
			print("Failed to encode order")
			return nil
		}
		
		/// Set up an `URLRequest` to send data over a network call
		private func createAndConfigNetworkRequest() -> URLRequest {
			var request = URLRequest(url: Constants.Api.baseUrl)
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpMethod = "POST"

			return request
		}
		
		/// Run a pre-configured network request,
		/// and process the response sent back from an API service
		private func fetch(_ request: URLRequest, from inputData: Data) async throws -> Order {
				let urlSession = URLSession.shared
				let (dataReceivedFromApiService, _) = try await urlSession.upload(for: request, from: inputData)
				return try JSONDecoder().decode(Order.self, from: dataReceivedFromApiService)
		}
		
		private func updateConfirmationContent(from decodedOrder: Order) {
			DispatchQueue.main.async { [weak self] in
				self?.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Cupcake.types[decodedOrder.item.type].rawValue.lowercased()) cupcakes is on its way!"
				self?.showingConfirmation.toggle()
			}
		}
		
		private func updateConfirmationContentForFailure() -> Void {
			DispatchQueue.main.async { [weak self] in
				self?.confirmationMessage = "Checkout Failed! Please check your Internet connection and try again later."
				self?.showingConfirmation.toggle()
			}
		}
	}
}
