//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var orderWrapper: OrderWrapper
	
	var body: some View {
		Form {
			Section {
				TextField("Name", text: $orderWrapper.order.name)
				TextField("Street Address", text: $orderWrapper.order.streetAddress)
				TextField("City", text: $orderWrapper.order.city)
				TextField("Zip", text: $orderWrapper.order.zip)
			}
			
			Section {
				NavigationLink {
					CheckoutView(orderWrapper: orderWrapper)
				} label: {
					Text("Check Out")
				}
			}
			.disabled(orderWrapper.order.hasValidAddress == false)
		}
		.navigationTitle("Delivery details")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(orderWrapper: .init(order: .init()))
	}
}
