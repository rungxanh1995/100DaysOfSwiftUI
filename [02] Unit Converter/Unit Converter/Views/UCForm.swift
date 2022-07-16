//
//  UCForm.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct UCForm: View {
	/// Available unit types
	private var unitTypes: [UnitType.Type] { UnitTypeStore.defaultStore }
	
	/// Unit type selected by user to start
	@State private var unitTypeSelected = 0
	
	/// User input for a unit
	@State private var userUnitInput = ""
	@FocusState private var isUserInputFocused: Bool

	/// Available units for selected unit type
	private var availableConvertUnits: [UCUnit] {
		unitTypes.element(at: unitTypeSelected).units
	}
	
	/// Selected source indices for all unit types
	@State private var sourceUnitIndices = Array(repeating: 0, count: UnitTypeStore.defaultStore.count)
	/// Selected source unit
	private var sourceUnitSelected: UCUnit {
		let selectedIndex = sourceUnitIndices[unitTypeSelected]
		return availableConvertUnits.element(at: selectedIndex)
	}
	
	/// Selected destination indices for all unit types
	@State private var destinationUnitIndices = Array(repeating: 0, count: UnitTypeStore.defaultStore.count)
	/// Selected destination unit
	private var destinationUnitSelected: UCUnit {
		let selectedIndex = destinationUnitIndices[unitTypeSelected]
		return availableConvertUnits.element(at: selectedIndex)
	}
	
	private var convertedResult: Double {
		let source = Measurement(
			value: Double(userUnitInput) ?? 0.0,
			unit: sourceUnitSelected.unit
		)
		return source.converted(to: destinationUnitSelected.unit).value
	}
	
    var body: some View {
		Form {
			
			UCPickUnitTypeView(
				unitSelected: $unitTypeSelected,
				units: unitTypes
			)
			
			UCSourceUnitView(
				input: $userUnitInput,
				isInputInFocus: $isUserInputFocused,
				sourceUnitName: sourceUnitSelected.name.localized(),
				sourceUnitSelected: $sourceUnitIndices.element(at: unitTypeSelected),
				availableUnits: availableConvertUnits
			)
			
			UCDestinationUnitView(
				result: convertedResult,
				destinationUnitName: destinationUnitSelected.name.localized(),
				destinationUnitSelected: $destinationUnitIndices.element(at: unitTypeSelected),
				availableUnits: availableConvertUnits
			)
		}
		.navigationTitle(
			Text("APP_NAME".localized())
		)
		.toolbar {
			ToolbarItemGroup(placement: .keyboard) {
				Spacer()
				Button(
					"KEYBOARD_BUTTON_DONE".localized()
				) {
					isUserInputFocused = false
				}
				.font(.body.bold())
				.foregroundStyle(.primary)
			}
		}
    }
}

