//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct CheckoutView: View {
	@ObservedObject var viewModel: CheckoutView.ViewModel
	
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
						await viewModel.placeOrder()
					}
				}
				.padding()
				
				if viewModel.showingConfirmation {
					Text(viewModel.confirmationMessage)
						.bold()
				}
			}
			.animation(.easeInOut, value: viewModel.showingConfirmation)
		}
		.navigationTitle("Check out")
		.navigationBarTitleDisplayMode(.inline)
	}
	
}

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(viewModel: .init(order: .init()))
	}
}
