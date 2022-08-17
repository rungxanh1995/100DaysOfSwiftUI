//
//  HabitItem.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

struct HabitItem: Codable, Identifiable {
	var id: UUID = UUID()
	
	var name: String {
		didSet { lastUpdated = Date() }
	}
	
	/// Once chosen, cannot be modified.
	/// I haven't figured out how to move a habit
	/// from once category to another when edited.
	let category: Self.Category
	
	var startDate: Date {
		didSet { lastUpdated = Date() }
	}
	
	var numericStartDate: String {
		startDate.formatted(date: .numeric, time: .omitted)
	}
	
	var shortStartDate: String {
		startDate.formatted(date: .abbreviated, time: .omitted)
	}
	
	var lastUpdated: Date = Date()
	
	var completedTimes: Int {
		didSet { lastUpdated = Date() }
	}
	
	var notes: String {
		didSet { lastUpdated = Date() }
	}
}
