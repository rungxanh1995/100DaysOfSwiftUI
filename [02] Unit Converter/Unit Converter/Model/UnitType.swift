//
//  UnitType.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

/// Units of a similar category
protocol UnitType {
	static var name: String { get }
	static var units: [UCUnit] { get }
}
