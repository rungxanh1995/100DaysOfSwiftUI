//
//  User.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
	
	internal struct Friend: Identifiable, Codable, Hashable {
		let id: String
		let name: String
	}
	
	let id: String
	let isActive: Bool
	let name: String
	let age: Int
	let company: String
	let email: String
	let address: String
	let about: String
	let registered: String
	let tags: [String]
	let friends: [Friend]
	
	/// Converts UTC date string to human-readable  format
	var formattedRegisterDate: String {
		let dateFormatter = ISO8601DateFormatter()
		let date = dateFormatter.date(from: registered)
		return date?.formatted() ?? "Misformatted Registered Date"
	}
}
