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
	
	var category: Self.Category {
		didSet { lastUpdated = Date() }
	}
	
	var startDate: Date {
		didSet { lastUpdated = Date() }
	}
	
	var lastUpdated: Date = Date()
	
	var completedTimes: Int {
		didSet { lastUpdated = Date() }
	}
	
	var notes: String {
		didSet { lastUpdated = Date() }
	}
}
