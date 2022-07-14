//
//  UCPickUnitTypeView.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

/// Let user select an input unit category to start the process
struct UCPickUnitTypeView: View {
	@Binding var unitSelected: Int
	let units: [UnitType.Type]
	
    var body: some View {
		Section(
			header: Text("CHOOSE_UNIT_LABEL".localized())
		) {
			Picker(
				"CHOOSE_UNIT_LABEL".localized(),
				selection: $unitSelected
			) {
				ForEach(0..<units.count, id: \.self) {
					Text(
						units
							.element(at: $0)
							.name
							.localized()
					)
				}
			}
		}
    }
}

