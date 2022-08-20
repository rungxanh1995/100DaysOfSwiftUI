//
//  AddressViewModel.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-19.
//

import Foundation

extension AddressView {
	final class ViewModel: ObservableObject {
		@Published
		var order: Order
		
		var orderHasValidAddress: Bool {
			return order.address.hasValidAddress
		}
		
		init(order: Order) {
			self.order = order
		}
	}
}
