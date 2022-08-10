//
//  Mission.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import Foundation

struct Mission: Codable, Identifiable {
	
	internal struct Crew: Codable {
		let name: String
		let role: String
	}
	
	let id: Int
	let launchDate: Date?
	let crew: [Crew]
	let description: String
	
	var displayName: String {
		"Apollo \(id)"
	}
	
	/// Matches the image file names format in Assets catalog
	var imageName: String {
		"apollo\(id)"
	}
	
	var formattedLaunchDate: String {
		launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "No Launch Date"
	}
}
