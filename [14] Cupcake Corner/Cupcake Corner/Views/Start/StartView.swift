//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct StartView: View {
	@StateObject
	private var orderWrapper: OrderWrapper
	
	init(orderWrapper: OrderWrapper = .init(order: .init())) {
		_orderWrapper = StateObject(wrappedValue: orderWrapper)
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type", selection: $orderWrapper.order.item.type) {
						ForEach(Cupcake.types.indices, id: \.self) {
							Text("\(Cupcake.types[$0].rawValue)")
						}
					}
					
					Stepper("Number of cakes: \(orderWrapper.order.quantity)", value: $orderWrapper.order.quantity, in: 3...20)
				}
				
				Section {
					Toggle("Any special requests?", isOn: $orderWrapper.order.withSpecialRequest.animation())
					
					if orderWrapper.order.withSpecialRequest {
						Toggle("Add extra frosting", isOn: $orderWrapper.order.item.moreFrostingAdded)
						
						Toggle("Add extra sprinkles", isOn: $orderWrapper.order.item.sprinklesAdded)
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
		StartView(orderWrapper: .init(order: .init()))
    }
}
