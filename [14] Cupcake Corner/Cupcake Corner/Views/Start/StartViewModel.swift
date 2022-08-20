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
		
		private(set) var decorativeCupcakeImage: URL?
		
		init(order: Order) {
			self.order = order
			self.decorativeCupcakeImage = Constants.randomDecorativeCupcakeUrl
		}
		
		func startNewOrder() -> Void {
			self.order = .init()
			self.decorativeCupcakeImage = Constants.randomDecorativeCupcakeUrl
		}
	}
}

