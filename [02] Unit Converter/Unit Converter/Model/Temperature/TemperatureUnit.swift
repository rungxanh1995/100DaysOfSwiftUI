//
//  TemperatureUnit.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

struct TemperatureUnit: UnitType {
	static let name = "TEMPERATURE"
	static let units = [celcius, farenheit, kelvin]
	
	private static let celcius = UCUnit(name: "CELCIUS", unit: UnitTemperature.celsius)
	private static let farenheit = UCUnit(name: "FARENHEIT", unit: UnitTemperature.fahrenheit)
	private static let kelvin = UCUnit(name: "KELVIN", unit: UnitTemperature.kelvin)
}
