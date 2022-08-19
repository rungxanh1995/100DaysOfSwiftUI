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
		
		@Published
		private(set) var confirmationMessage: String
		
		@Published
		private(set) var showingConfirmation: Bool
		
		init(order: Order) {
			self.order = order
			confirmationMessage = ""
			showingConfirmation = false
		}
		
		func placeOrder() async -> Void {
			// 1. Convert our current order object into some JSON data that can be sent
			guard let encoded = try? JSONEncoder().encode(self.order) else {
				print("Failed to encode order")
				return
			}
			
			// 2. Tell Swift how to send that data over a network call
			let url = URL(string: "https://reqres.in/api/cupcakes")!
			var request = URLRequest(url: url)
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpMethod = "POST"
			
			// 3. Run that request and process the response
			do {
				let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
				// handle the result
				let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
				DispatchQueue.main.async { [weak self] in
					self?.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Cupcake.types[decodedOrder.item.type].rawValue.lowercased()) cupcakes is on its way!"
					self?.showingConfirmation.toggle()
				}
				
			} catch {
				print("Checkout failed.")
			}
		}
	}
}
