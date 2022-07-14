//
//  UCSourceUnitView.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct UCSourceUnitView: View {
	@Binding var input: String
	var sourceUnitName: String
	@Binding var sourceUnitSelected: Int
	let availableUnits: [UCUnit]
	
	
	var body: some View {
		Section(
			header: Text("CONVERT_FROM_HEADER".localized())
		) {
			// Input
			HStack {
				TextField(
					"VALUE_PLACEHOLDER".localized(),
					text: $input)
				.keyboardType(.decimalPad)
				
				Spacer()
				
				Text(sourceUnitName)
			}
			
			// Unit selection
			Picker(
				"SOURCE_UNIT_HEADER".localized(),
				selection: $sourceUnitSelected
			) {
				ForEach(0 ..< availableUnits.count, id: \.self) {
					Text(availableUnits[$0].name.localized())
				}
			}
			.pickerStyle(.segmented)
		}
	}
}
