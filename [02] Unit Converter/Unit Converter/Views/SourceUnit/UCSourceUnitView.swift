//
//  UCSourceUnitView.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct UCSourceUnitView: View {
	@Binding var input: String
	var isInputInFocus: FocusState<Bool>.Binding
	var sourceUnitName: String
	@Binding var sourceUnitSelected: Int
	let availableUnits: [UCUnit]
	
	
	var body: some View {
		Section(
			header: Text("CONVERT_FROM_HEADER".localized()),
			footer: Text("CONVERT_FROM_FOOTER".localized())
		) {
			// Input
			HStack {
				TextField(
					"VALUE_PLACEHOLDER".localized(),
					text: $input)
				.keyboardType(.decimalPad)
				.focused(isInputInFocus)
				
				Spacer()
				
				Text(sourceUnitName)
			}
			
			// Unit selection
			UCUnitPicker(
				header: "SOURCE_UNIT_HEADER".localized(),
				selected: $sourceUnitSelected,
				unitOptions: availableUnits
			)
		}
		.listRowSeparator(.hidden)
	}
}
