//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct ContentView: View {
	@StateObject
	private var orderWrapper: OrderWrapper
	
	init(orderWrapper: OrderWrapper = .init(order: .init())) {
		_orderWrapper = StateObject(wrappedValue: orderWrapper)
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type", selection: $orderWrapper.order.type) {
						ForEach(OrderWrapper.Order.types.indices, id: \.self) {
							Text(OrderWrapper.Order.types[$0])
						}
					}
					
					Stepper("Number of cakes: \(orderWrapper.order.quantity)", value: $orderWrapper.order.quantity, in: 3...20)
				}
				
				Section {
					Toggle("Any special requests?", isOn: $orderWrapper.order.specialRequestEnabled.animation())
					
					if orderWrapper.order.specialRequestEnabled {
						Toggle("Add extra frosting", isOn: $orderWrapper.order.extraFrosting)
						
						Toggle("Add extra sprinkles", isOn: $orderWrapper.order.addSprinkles)
					}
				}
				
				Section {
					NavigationLink {
						AddressView(orderWrapper: orderWrapper)
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
		ContentView(orderWrapper: .init(order: .init()))
    }
}
