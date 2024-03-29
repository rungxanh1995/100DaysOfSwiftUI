//
//  Address.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-18.
//

import Foundation

struct Address: Codable {
	
	// MARK: - Codable Properties
	var contactName: String
	var streetAddress: String
	var city: String
	var zipCode: String
	
	// MARK: - Initializers
	init() {
		self.contactName = ""
		self.streetAddress = ""
		self.city = ""
		self.zipCode = ""
	}
	
	var hasValidAddress: Bool {
		return (anyFieldIsEmpty || anyFieldContainsOnlyWhiteSpaces) ? false : true
	}
	
	private var anyFieldIsEmpty: Bool {
		contactName.isEmpty
		|| streetAddress.isEmpty
		|| city.isEmpty
		|| zipCode.isEmpty
	}
	
	private var anyFieldContainsOnlyWhiteSpaces: Bool {
		contactName.trimmingCharacters(in: .whitespaces) == ""
		|| streetAddress.trimmingCharacters(in: .whitespaces) == ""
		|| city.trimmingCharacters(in: .whitespaces) == ""
		|| zipCode.trimmingCharacters(in: .whitespaces) == ""
	}
}
