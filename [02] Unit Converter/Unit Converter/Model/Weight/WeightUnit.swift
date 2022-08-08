//
//  WeightUnit.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-08-08.
//

import Foundation

struct WeightUnit: UnitType {
	static let name = "WEIGHT"
	static let units = [kilograms, pounds]
	
	private static let kilograms = UCUnit(name: "KILOGRAMS", unit: UnitMass.kilograms)
	private static let pounds = UCUnit(name: "POUNDS", unit: UnitMass.pounds)
}
