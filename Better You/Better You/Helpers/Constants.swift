//
//  Constants.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-16.
//

import Foundation


enum Constants {
	/// Provides access to constants when creating or editing a `HabitItem`.
	///
	/// Defined as an enum to prevent calling its initializer
	internal enum ForHabit {
		static let dateRangeUntilToday: PartialRangeThrough<Date> = ...Date()
		
		static let reasonableCompletedTimes: ClosedRange<Int> = 0...100
		
		static let allategories: [HabitItem.Category] = HabitItem.Category.allCases
	}
	
}
