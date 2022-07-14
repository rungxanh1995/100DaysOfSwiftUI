//
//  UCUnitPicker.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

/// Presents a picker of units for a specific unit type.
/// For example: units for temperature are Celcius, Farenheit, Kelvin.
struct UCUnitPicker: View {
	let header: String
	@Binding var selected: Int
	let unitOptions: [UCUnit]
	
    var body: some View {
		Picker(
			header,
			selection: $selected
		) {
			ForEach(0 ..< unitOptions.count, id: \.self) {
				Text(unitOptions.element(at: $0).name.localized())
			}
		}
		.pickerStyle(.segmented)
    }
}
