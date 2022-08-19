//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct StartView: View {
	@StateObject
	private var viewModel: StartView.ViewModel
	
	init(viewModel: StartView.ViewModel = .init(order: .init())) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationView {
			Form {
				decorativeCupcakeImage
				requiredSelectionsView
				optionalRequestsView
				linkToDeliveryView
			}
			.navigationTitle("Cupcake Corner")
		}
    }
}

extension StartView {
	@ViewBuilder
	var decorativeCupcakeImage: some View {
		HStack(alignment: .center) {
			Spacer()
			AsyncImage(url: URL(string: "https://cdn.dribbble.com/users/21264/screenshots/1282595/media/e38f40834c14e52559a1c65cec518c98.png"), scale: 3) { phase in
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
			Spacer()
		}
	}
	
	@ViewBuilder
	var requiredSelectionsView: some View {
		Section(
			header: Text("Required selections")
		) {
			Picker("Cake type", selection: $viewModel.order.item.type) {
				ForEach(Cupcake.types.indices, id: \.self) {
					Text("\(Cupcake.types[$0].rawValue)")
				}
			}
			
			Stepper(
				"Batch size: \(viewModel.order.quantity)",
				value: $viewModel.order.quantity,
				in: 3...20
			)
		}
	}
	
	@ViewBuilder
	var optionalRequestsView: some View {
		Section(
			header: Text("Optional requests")
		) {
			Toggle("Any special requests?", isOn: $viewModel.order.withSpecialRequest.animation())
			
			if viewModel.order.withSpecialRequest {
				Toggle(
					"🧁 Extra frosting",
					isOn: $viewModel.order.item.moreFrostingAdded
				)
				.font(.callout)
				.padding(.leading)
				
				Toggle(
					"✨ Extra sprinkles",
					isOn: $viewModel.order.item.sprinklesAdded
				)
				.font(.callout)
				.padding(.leading)
			}
		}
		.listRowSeparator(.hidden)
	}
	
	@ViewBuilder
	var linkToDeliveryView: some View {
		Section(
			header: Text("Next step")
		) {
			NavigationLink {
				AddressView(viewModel: .init(order: viewModel.order))
			} label: {
				HStack {
					Image(systemName: "shippingbox")
						.symbolRenderingMode(.hierarchical)
					Text("Set Delivery Details")
				}
				.font(.headline)
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		  StartView(viewModel: .init(order: .init()))
    }
}
