//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var viewModel: AddressView.ViewModel
	
	var body: some View {
		Form {
			Section {
				TextField("Name", text: $viewModel.order.address.contactName)
				TextField("Street Address", text: $viewModel.order.address.streetAddress)
				TextField("City", text: $viewModel.order.address.city)
				TextField("Zip", text: $viewModel.order.address.zipCode)
			}
			
			Section {
				NavigationLink {
					CheckoutView(viewModel: .init(order: viewModel.order))
				} label: {
					Text("Check Out")
				}
			}
			.disabled(viewModel.orderHasValidAddress == false)
		}
		.navigationTitle("Delivery details")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(viewModel: .init(order: .init()))
	}
}
