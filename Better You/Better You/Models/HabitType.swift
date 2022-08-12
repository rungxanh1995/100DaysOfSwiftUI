//
//  HabitType.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

enum HabitType: String, Codable, CaseIterable {
	case hourly = "Hourly"
	case daily = "Daily"
	case weekly = "Weekly"
	case biweekly = "Bi-weekly"
	case monthly = "Monthly"
}
