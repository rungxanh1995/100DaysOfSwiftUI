//
//  NumberOfPeoplePicker.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//

import SwiftUI

internal struct NumberOfPeoplePicker: View {
	
	@Binding var numPeople: Int
	@Binding var rangeOfPeople: Range<Int>
	
	var body: some View {
		Picker(
			"NUM_PEOPLE_LABEL".localized(),
			selection: $numPeople
		) {
			ForEach(rangeOfPeople, id: \.self) {
				Text("\($0) \("PEOPLE".localized())")
			}
		}
	}
}
