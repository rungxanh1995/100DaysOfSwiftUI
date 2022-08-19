//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct CheckoutView: View {
	@ObservedObject var viewModel: CheckoutView.ViewModel
	
	@State private var confirmationMessage = ""
	@State private var showingConfirmation = false
	
	var body: some View {
		ScrollView {
			VStack {
				AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
					image
						.resizable()
						.scaledToFit()
				} placeholder: {
					ProgressView()
				}
				.frame(height: 233)
				
				Text("Your total is \(viewModel.order.cost, format: .currency(code: "USD"))")
					.font(.title)
				
				Button("Place Order") {
					Task {
						await placeOrder()
					}
				}
				.padding()
			}
		}
		.navigationTitle("Check out")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Thank you!", isPresented: $showingConfirmation) {
			Button("OK") { }
		} message: {
			Text(confirmationMessage)
		}
	}
	
	func placeOrder() async {
		// 1. Convert our current order object into some JSON data that can be sent
		guard let encoded = try? JSONEncoder().encode(self.viewModel.order) else {
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
			confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Cupcake.types[decodedOrder.item.type].rawValue.lowercased()) cupcakes is on its way!"
			showingConfirmation = true
		} catch {
			print("Checkout failed.")
		}
	}
}

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(viewModel: .init(order: .init()))
	}
}
