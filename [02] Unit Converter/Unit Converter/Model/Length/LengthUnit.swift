//
//  LengthUnit.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

struct LengthUnit: UnitType {
	static let name = "LENGTH"
	static let units = [meters, kilometers, feet, yards, miles]
	
	private static let meters = UCUnit(name: "METERS", unit: UnitLength.meters)
	private static let kilometers = UCUnit(name: "KILOMETERS", unit: UnitLength.kilometers)
	private static let feet = UCUnit(name: "FEET", unit: UnitLength.feet)
	private static let yards = UCUnit(name: "YARDS", unit: UnitLength.yards)
	private static let miles = UCUnit(name: "MILES", unit: UnitLength.miles)
}
