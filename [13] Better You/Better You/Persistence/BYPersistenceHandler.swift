//
//  BYPersistenceHandler.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

final class BYPersistenceHandler {
	let daily: Persistence
	let weekly: Persistence
	let monthly: Persistence
	
	init(
		dailyPersistence: Persistence = BYPersistence(/* for: */ habitCategory: .daily),
		weeklyPersistence: Persistence = BYPersistence(/* for: */ habitCategory: .weekly),
		monthlyPersistence: Persistence = BYPersistence(/* for: */ habitCategory: .monthly)
	) {
		self.daily = dailyPersistence
		self.weekly = weeklyPersistence
		self.monthly = monthlyPersistence
	}
}
