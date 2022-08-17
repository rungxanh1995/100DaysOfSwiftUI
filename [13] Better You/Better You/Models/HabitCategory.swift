//
//  HabitCategory.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

extension HabitItem {
	enum Category: String, Codable, CaseIterable {
		case daily = "Daily"
		case weekly = "Weekly"
		case monthly = "Monthly"
	}
}
