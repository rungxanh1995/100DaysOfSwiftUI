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
				HStack(alignment: .center) {
					Spacer()
					AsyncImage(url: URL(string: "https://cdn.dribbble.com/users/21264/screenshots/1282595/media/e38f40834c14e52559a1c65cec518c98.png"), scale: 3) { image in
						image
							.resizable()
							.scaledToFit()
							.cornerRadius(12)
							.padding(.vertical)
					} placeholder: {
						ProgressView()
					}
					.frame(height: 233)
					Spacer()
				}
				
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
			.navigationTitle("Cupcake Corner")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		  StartView(viewModel: .init(order: .init()))
    }
}
