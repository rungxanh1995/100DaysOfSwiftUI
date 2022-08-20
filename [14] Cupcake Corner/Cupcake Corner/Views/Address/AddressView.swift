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
			deliveryAddressFields
			linkToCheckout
		}
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .principal) {
				Text("Delivery Info")
					.font(.system(.title3, design: .serif).bold())
			}
		}
	}
}

extension AddressView {
	@ViewBuilder
	var deliveryAddressFields: some View {
		Section(
			header: Text("Customer Details"),
			footer: Text("All fields are required")
		) {
			TextField(
				"Contact Name",
				text: $viewModel.order.address.contactName
			)
			TextField(
				"Street Address",
				text: $viewModel.order.address.streetAddress
			)
			TextField(
				"City",
				text: $viewModel.order.address.city
			)
			TextField(
				"Zip Code",
				text: $viewModel.order.address.zipCode
			)
		}
	}
	
	@ViewBuilder
	var linkToCheckout: some View {
		Section(
			header: Text("Next step")
		) {
			NavigationLink {
				CheckoutView(viewModel: .init(order: viewModel.order))
			} label: {
				HStack {
					Image(systemName: "creditcard")
						.symbolRenderingMode(.hierarchical)
					Text("Check Out")
				}
				.font(.headline)
			}
		}
		.disabled(viewModel.orderHasValidAddress == false)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(viewModel: .init(order: .init()))
	}
}
