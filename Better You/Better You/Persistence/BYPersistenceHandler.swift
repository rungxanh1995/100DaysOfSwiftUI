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
	let monthly: Persitence
	
	init(
		dailyPersistence: Persitence = BYPersistence(/* for: */ habitCategory: .daily),
		weeklyPersistence: Persitence = BYPersistence(/* for: */ habitCategory: .weekly),
		monthlyPersistence: Persitence = BYPersistence(/* for: */ habitCategory: .monthly)
	) {
		self.daily = dailyPersistence
		self.weekly = weeklyPersistence
		self.monthly = monthlyPersistence
	}
}
