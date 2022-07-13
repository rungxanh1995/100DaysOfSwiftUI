//
//  CheckAmountInput.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//

import SwiftUI

internal struct CheckAmountInput: View {
	
	@Binding var checkAmount: Double
	var amountIsFocused: FocusState<Bool>.Binding
	
	var body: some View {
		HStack {
			Text(
				"CHECK_AMOUNT_LABEL".localized()
			)
			.frame(maxWidth: 180, alignment: .leading)
			
			TextField(
				"CHECK_AMOUNT_PLACEHOLDER".localized(),
				value: $checkAmount,
				format: .currency(code: Locale.current.currencyCode ?? "USD")
			)
			.multilineTextAlignment(.trailing)
			.frame(maxWidth: 120, alignment: .trailing)
			.keyboardType(.decimalPad)
			.focused(amountIsFocused)
		}
	}
}
