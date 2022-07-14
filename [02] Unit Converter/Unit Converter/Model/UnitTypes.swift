//
//  UnitTypes.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

/// List of all unit types supported
struct UnitTypes {
	static let allTypes: [UnitType.Type] = [
		TemperatureUnit.self,
		LengthUnit.self,
		TimeUnit.self,
		VolumeUnit.self
	]
}
