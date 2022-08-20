//
//  Cupcake.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-18.
//

import Foundation

/// Item for the `Order`
struct Cupcake: Codable {
	
	internal enum Types: String, Codable, CaseIterable {
		case vanilla = "Vanilla"
		case strawberry = "Strawberry"
		case chocolate = "Chocolate"
		case rainbow = "Rainbow"
	}
	
	// MARK: - Properties
	
	static let types: [Cupcake.Types] = Cupcake.Types.allCases
	/// Acts as the index to select in array of cupcake types
	var type: Int
	var moreFrostingAdded: Bool
	var sprinklesAdded: Bool
	
	// MARK: - Initializers
	init() {
		self.type = 0
		self.moreFrostingAdded = false
		self.sprinklesAdded = false
	}
}
