//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct ContentView: View {
	@StateObject
	private var order: Order = Order()
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type", selection: $order.type) {
						ForEach(Order.types.indices, id: \.self) {
							Text(Order.types[$0])
						}
					}
					
					Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
				}
				
				Section {
					Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
					
					if order.specialRequestEnabled {
						Toggle("Add extra frosting", isOn: $order.extraFrosting)
						
						Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
					}
				}
				
				Section {
					NavigationLink {
						AddressView(order: order)
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
        ContentView()
    }
}
