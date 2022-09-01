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
	
	// MARK: - Time properties
	/// Converts UTC date string to human-readable  format
	var formattedRegisterDate: String {
		return registeredDate.formatted(date: .abbreviated, time: .omitted)
	}
	
	var yearsAndMonthsSinceRegisteredUntilNow: String {
		let diffComponents = Calendar.current.dateComponents([.year, .month], from: registeredDate, to: Date.now)
		let years = diffComponents.year
		let months = diffComponents.month
		return "\(years ?? 0) years \(months ?? 0) months"
	}
	
	private var registeredDate: Date {
		let dateFormatter = ISO8601DateFormatter()
		let date = dateFormatter.date(from: registered)
		return date ?? Date.distantPast
	}
}

extension User {
	/// A static sample User to help testing or debugging
	static var sampleUser: User {
		User(
			id: "873b00ed-631f-4acd-b397-b868cb8790c8",
			isActive: true,
			name: "Katheryn Hensley",
			age: 21,
			company: "Makingway",
			email: "katherynhensley@makingway.com",
			address: "872 Beadel Street, Swartzville, Iowa, 2084",
			about: "Aliquip incididunt dolor anim ullamco dolor ullamco qui amet sit non et eiusmod. Dolore aliqua cillum amet eu ex culpa deserunt adipisicing tempor aute nisi. Laborum tempor eiusmod dolore voluptate ex est exercitation occaecat ullamco. Sunt aliquip culpa sunt consequat sunt nisi ipsum nisi fugiat.",
			registered: "2015-06-13T03:46:17-01:00",
			tags: [
				"fugiat",
				"proident",
				"laboris",
				"ad",
				"ullamco",
				"consequat",
				"culpa"
			],
			friends: [
				Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")
			])
	}
}
