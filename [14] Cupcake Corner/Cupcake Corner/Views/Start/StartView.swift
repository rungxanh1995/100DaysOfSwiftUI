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
				Section {
					Picker("Select your cake type", selection: $viewModel.order.item.type) {
						ForEach(Cupcake.types.indices, id: \.self) {
							Text("\(Cupcake.types[$0].rawValue)")
						}
					}
					
					Stepper("Number of cakes: \(viewModel.order.quantity)", value: $viewModel.order.quantity, in: 3...20)
				}
				
				Section {
					Toggle("Any special requests?", isOn: $viewModel.order.withSpecialRequest.animation())
					
					if viewModel.order.withSpecialRequest {
						Toggle("Add extra frosting", isOn: $viewModel.order.item.moreFrostingAdded)
						
						Toggle("Add extra sprinkles", isOn: $viewModel.order.item.sprinklesAdded)
					}
				}
				
				Section {
					NavigationLink {
						AddressView(viewModel: .init(order: viewModel.order))
					} label: {
						Text("Delivery details")
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
