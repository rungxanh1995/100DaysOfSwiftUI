//
//  WeSplitView.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-12.
//

import SwiftUI

struct WeSplitView: View {
	
	@State private var checkAmount = 0.0
	@FocusState private var isCheckAmountFocused: Bool
	
	@State private var numberOfPeople = 2
	@State private var allowedPeopleRange = 2..<20
	
	@State private var isTipIncluded = true
	@State private var selectedTipPercentage = 10
	private let tipPercentages = [10, 15, 20, 25]
	
	private var totalPerPerson: Double {
		let tipSelected = isTipIncluded ? Double(selectedTipPercentage) / 100 : 0
		return (checkAmount * (1 + tipSelected)) / Double(numberOfPeople)
	}
	
	var body: some View {
		NavigationView {
			Form {
				
				Section(
					header: Text("GENERAL_HEADER".localized())
				) {
					CheckAmountInput(
						checkAmount: $checkAmount,
						amountIsFocused: $isCheckAmountFocused
					)
					
					NumberOfPeoplePicker(
						numPeople: $numberOfPeople,
						rangeOfPeople: $allowedPeopleRange
					)
					
					Toggle(isOn: $isTipIncluded) {
						Text("INCLUDE_TIP_LABEL".localized())
					}
				}
				
			
				Section(
					header: Text("TIP_PERCENT_HEADER".localized()),
					footer: Text("TIP_PERCENT_FOOTER".localized())
				) {
					TipPercentPicker(
						percentageOptions: tipPercentages,
						selectedOption: $selectedTipPercentage
					)
				}
				.isEmpty(!isTipIncluded)
				
				Section(
					header: Text("TOTAL_PER_PERSON_HEADER".localized())
				) {
					Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				}
			}
			.navigationTitle(
				"APP_NAME".localized()
			)
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button(
						"KEYBOARD_BUTTON_DONE".localized()
					) {
						isCheckAmountFocused = false
					}
				}
			}
		}
	}
}
