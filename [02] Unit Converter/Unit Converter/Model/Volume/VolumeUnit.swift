//
//  VolumeUnit.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

struct VolumeUnit: UnitType {
	static let name = "VOLUME"
	static let units = [milliliters, liters, cups, ounces]
	
	private static let milliliters = UCUnit(name: "MILLILITERS", unit: UnitVolume.milliliters)
	private static let liters = UCUnit(name: "LITERS", unit: UnitVolume.liters)
	private static let cups = UCUnit(name: "CUPS", unit: UnitVolume.cups)
	private static let ounces = UCUnit(name: "OUNCES", unit: UnitVolume.fluidOunces)
}
