//
//  StartViewModel.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-19.
//

import Foundation

extension StartView {
	final class ViewModel: ObservableObject {
		@Published
		var order: Order
		
		init(order: Order) {
			self.order = order
		}
	}
}
