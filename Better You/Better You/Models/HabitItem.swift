//
//  HabitItem.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

struct HabitItem: Codable, Identifiable {
	var id: UUID = UUID()
	let name: String
	let category: Self.Category
	let startDate: Date
	var lastUpdated: Date = Date()
	var completedTimes: Int {
		didSet {
			lastUpdated = Date()
		}
	}
	let notes: String
}
