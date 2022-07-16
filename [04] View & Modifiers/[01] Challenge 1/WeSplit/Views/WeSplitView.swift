//
//  WeSplitView.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-12.
//

import SwiftUI

struct WeSplitView: View {
	
	@State var check: Check
	@FocusState private var isCheckAmountFocused: Bool
	
	var body: some View {
		NavigationView {
			Form {
				
				Section(
					header: Text("GENERAL_HEADER".localized())
				) {
					CheckAmountInput(
						checkAmount: $check.originalAmount,
						amountIsFocused: $isCheckAmountFocused
					)
					
					NumberOfPeoplePicker(
						numPeople: $check.numberOfPeople,
						rangeOfPeople: check.allowedPeopleRange
					)
					
					Toggle(isOn: $check.isTipIncluded) {
						Text("INCLUDE_TIP_LABEL".localized())
					}
				}
				
			
				Section(
					header: Text("TIP_PERCENT_HEADER".localized()),
					footer: Text("TIP_PERCENT_FOOTER".localized())
				) {
					TipPercentPicker(
						percentageOptions: check.tipPercentages,
						selectedOption: $check.selectedTipPercentage
					)
				}
				.isEmpty(!check.isTipIncluded)
				
				Section(
					header: Text("GRAND_TOTAL_HEADER".localized()),
					footer: Text("GRAND_TOTAL_FOOTER".localized())
				) {
					Text(check.totalWithTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				}
				.isEmpty(!check.isTipIncluded)
				
				Section(
					header: Text("TOTAL_PER_PERSON_HEADER".localized())
				) {
					// Challenge: Red text if you're not tipping your server
					Text(check.totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
						.foregroundColor(check.isTipIncluded == true ? .primary : .red)
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
