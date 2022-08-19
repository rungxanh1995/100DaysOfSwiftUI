//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var orderWrapper: StartView.ViewModel
	
	var body: some View {
		Form {
			Section {
				TextField("Name", text: $orderWrapper.order.address.contactName)
				TextField("Street Address", text: $orderWrapper.order.address.streetAddress)
				TextField("City", text: $orderWrapper.order.address.city)
				TextField("Zip", text: $orderWrapper.order.address.zipCode)
			}
			
			Section {
				NavigationLink {
					CheckoutView(orderWrapper: orderWrapper)
				} label: {
					Text("Check Out")
				}
			}
			.disabled(orderWrapper.order.address.hasValidAddress == false)
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
