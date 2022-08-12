//
//  BYPersistenceHandler.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

final class BYPersistenceHandler {
	let daily: Persitence
	let weekly: Persitence
	let biweekly: Persitence
	let monthly: Persitence
	
	init(
		dailyPersistence: Persitence = BYPersistence(/* for: */ habitType: .daily),
		weeklyPersistence: Persitence = BYPersistence(/* for: */ habitType: .weekly),
		biweeklyPersistence: Persitence = BYPersistence(/* for: */ habitType: .biweekly),
		monthlyPersistence: Persitence = BYPersistence(/* for: */ habitType: .monthly)
	) {
		self.daily = dailyPersistence
		self.weekly = weeklyPersistence
		self.biweekly = biweeklyPersistence
		self.monthly = monthlyPersistence
	}
}
