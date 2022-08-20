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
				if viewModel.showingConfirmation {
					decorativeDeliveryGifImage
					orderConfirmationMessage
				} else {
					decorativeCupcakeImage
					orderTotal
					placeOrderButton
				}
			}
			.animation(.easeInOut, value: viewModel.showingConfirmation)
		}
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .principal) {
				Text("Check Out")
					.font(.system(.title3, design: .serif).bold())
			}
		}
	}
}

extension CheckoutView {
	@ViewBuilder
	var decorativeDeliveryGifImage: some View {
		GifImage("deliveryTruck")
			.frame(width: 300, height: 160)
			.cornerRadius(12)
			.padding()
	}
	
	@ViewBuilder
	var decorativeCupcakeImage: some View {
		AsyncImage(url: Constants.randomDecorativeCupcakeUrl, scale: 3) { phase in
			switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image
						.resizable()
						.scaledToFit()
						.cornerRadius(12)
				case .failure:
					Text("🧁")
						.font(.system(size: 160))
				@unknown default:
					EmptyView()
			}
		}
		.frame(height: 180)
	}
	
	@ViewBuilder
	var orderTotal: some View {
		Text("Your total is \(viewModel.order.cost, format: .currency(code: "USD"))")
			.font(.title)
	}
	
	@ViewBuilder
	var orderConfirmationMessage: some View {
		Text(viewModel.confirmationMessage)
			.font(.title3)
			.padding()
			.multilineTextAlignment(.center)
	}
	
	@ViewBuilder
	var placeOrderButton: some View {
		Button("Place Order") {
			Task {
				await viewModel.placeOrder()
			}
		}
		.padding()
		.tint(.pink)
		.buttonStyle(.borderedProminent)
	}
}

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(viewModel: .init(order: .init()))
	}
}
