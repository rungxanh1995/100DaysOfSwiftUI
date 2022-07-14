//
//  UCDestinationUnitView.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct UCDestinationUnitView: View {
	var result: Double
	var destinationUnitName: String
	@Binding var destinationUnitSelected: Int
	let availableUnits: [UCUnit]
	
    var body: some View {
		Section(
			header: Text("CONVERT_TO_HEADER".localized())
		) {
			// Result
			HStack {
				Text(result, format: .number)
				Spacer()
				Text(destinationUnitName)
			}
			
			// Unit selection
			Picker(
				"DESTINATION_UNIT_HEADER".localized(),
				selection: $destinationUnitSelected
			) {
				ForEach(0 ..< availableUnits.count, id: \.self) {
					Text(availableUnits.element(at: $0).name.localized())
				}
			}
			.pickerStyle(.segmented)
		}
    }
}
