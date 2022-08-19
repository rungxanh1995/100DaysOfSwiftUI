//
//  Order.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import Foundation

final class OrderWrapper: ObservableObject {
	@Published var order: Order
	
	init(order: Order) {
		self.order = order
	}
	
	internal struct Order: Codable {
		
		// MARK: - Properties
		var item: Cupcake
		var quantity: Int
		
		var withSpecialRequest: Bool {
			didSet {
				if withSpecialRequest == false {
					item.moreFrostingAdded = false
					item.sprinklesAdded = false
				}
			}
		}
		
		var address: Address
		
		var cost: Double {
			// $2 per cake
			var cost = Double(quantity) * 2.00
			
			// complicated cakes cost more
			cost += (Double(item.type) / 2)
			
			// $1/cake for extra frosting
			if item.moreFrostingAdded {
				cost += Double(quantity)
			}
			
			// $0.50/cake for sprinkles
			if item.sprinklesAdded {
				cost += Double(quantity) * 0.50
			}
			
			return cost
		}
		
		// MARK: - Initializer
		init(
			item: Cupcake = .init(),
			quantity: Int = 3,
			withSpecialRequest: Bool = false,
			address: Address = .init()
		) {
			self.item = item
			self.quantity = quantity
			self.withSpecialRequest = withSpecialRequest
			self.address = address
		}
	}
}
