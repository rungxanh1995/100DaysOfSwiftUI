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
	let completedTimes: Int
	let notes: String
}
