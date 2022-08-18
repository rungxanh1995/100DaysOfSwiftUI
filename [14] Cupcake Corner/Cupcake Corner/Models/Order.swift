//
//  Order.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-17.
//

import Foundation

class Order: ObservableObject, Codable {
	enum CodingKeys: CodingKey {
		case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
	}
	
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
	
	@Published var type = 0
	@Published var quantity = 3
	
	@Published var specialRequestEnabled = false {
		didSet {
			if specialRequestEnabled == false {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	@Published var extraFrosting = false
	@Published var addSprinkles = false
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
	
	@Published var name = ""
	@Published var streetAddress = ""
	@Published var city = ""
	@Published var zip = ""
	var hasValidAddress: Bool {
		if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
			return false
		}
		
		return true
	}
	
	init() { }
	
	// TODO: I think there should be another init() with all defaults instead of hardcoding values to variables
	
	// MARK: - Conform to Decodable
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		type = try container.decode(Int.self, forKey: .type)
		quantity = try container.decode(Int.self, forKey: .quantity)
		
		extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
		addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
		
		name = try container.decode(String.self, forKey: .name)
		streetAddress = try container.decode(String.self, forKey: .streetAddress)
		city = try container.decode(String.self, forKey: .city)
		zip = try container.decode(String.self, forKey: .zip)
	}
	
	// MARK: - Conform to Encodable
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: Self.CodingKeys.self)
		
		try container.encode(type, forKey: .type)
		try container.encode(quantity, forKey: .quantity)
		
		try container.encode(extraFrosting, forKey: .extraFrosting)
		try container.encode(addSprinkles, forKey: .addSprinkles)
		
		try container.encode(name, forKey: .name)
		try container.encode(streetAddress, forKey: .streetAddress)
		try container.encode(city, forKey: .city)
		try container.encode(zip, forKey: .zip)
	}
}
