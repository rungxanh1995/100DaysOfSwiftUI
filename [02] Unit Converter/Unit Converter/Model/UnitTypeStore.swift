//
//  UnitTypes.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

/// List of all unit types supported
struct UnitTypeStore {
	static let defaultStore: [UnitType.Type] = {
		var data: [UnitType.Type] = []
		data.append(TemperatureUnit.self)
		data.append(LengthUnit.self)
		data.append(TimeUnit.self)
		data.append(VolumeUnit.self)
		return data
	}()
}
