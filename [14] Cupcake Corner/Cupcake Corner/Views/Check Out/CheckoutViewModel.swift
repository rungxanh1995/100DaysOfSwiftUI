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
		
		private var apiService: OrderService
		
		private(set) var decorativeCupcakeImage: URL?

		@Published
		private(set) var confirmationMessage: String
		
		@Published
		private(set) var showingConfirmation: Bool
		
		init(
			order: Order
		) {
			self.order = order
			self.apiService = OrderServiceImpl(order: order)
			self.decorativeCupcakeImage = Constants.ImageUrl.randomCupcake
			confirmationMessage = ""
			showingConfirmation = false
		}
		
		func placeOrder() async -> Void {
			do {
				guard let confirmedOrder = try await apiService.uploadAndReceive() else { return }
				updateConfirmationContent(from: confirmedOrder)
			} catch {
				updateConfirmationContentForFailure()
			}
		}
		
		private func updateConfirmationContent(from decodedOrder: Order) -> Void {
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
