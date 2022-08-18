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
		static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
		
		var type = 0
		var quantity = 3
		
		var specialRequestEnabled = false {
			didSet {
				if specialRequestEnabled == false {
					extraFrosting = false
					addSprinkles = false
				}
			}
		}
		var extraFrosting = false
		var addSprinkles = false
		var cost: Double {
			// $2 per cake
			var cost = Double(quantity) * 2
			
			// complicated cakes cost more
			cost += (Double(type) / 2)
			
			// $1/cake for extra frosting
			if extraFrosting {
				cost += Double(quantity)
			}
			
			// $0.50/cake for sprinkles
			if addSprinkles {
				cost += Double(quantity) / 2
			}
			
			return cost
		}
		
		var name = ""
		var streetAddress = ""
		var city = ""
		var zip = ""
		var hasValidAddress: Bool {
			if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
				return false
			}
			
			return true
		}
	}
}
