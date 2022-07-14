//
//  TimeUnit.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

struct TimeUnit: UnitType {
	static let name = "TIME"
	static let units = [seconds, minutes, hours]
	
	private static let seconds = UCUnit(name: "SECONDS", unit: UnitDuration.seconds)
	private static let minutes = UCUnit(name: "MINUTES", unit: UnitDuration.minutes)
	private static let hours = UCUnit(name: "HOURS", unit: UnitDuration.hours)
}
