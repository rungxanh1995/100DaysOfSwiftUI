//
//  TipPercentPicker.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//

import SwiftUI

struct TipPercentPicker: View {
	let percentageOptions: [Int]
	@Binding var selectedOption: Int
	
	var body: some View {
		Picker(
			"TIP_PERCENT_TITLE".localized(),
			selection: $selectedOption
		) {
			ForEach(percentageOptions, id: \.self) {
				Text($0, format: .percent)
			}
		}
		.pickerStyle(.segmented)
	}
}
