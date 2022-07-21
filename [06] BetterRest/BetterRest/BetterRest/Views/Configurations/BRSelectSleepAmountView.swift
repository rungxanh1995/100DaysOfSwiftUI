//
//  BRSelectSleepAmountView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-21.
//

import SwiftUI

struct BRSelectSleepAmountView: View {
	@Binding
	var domainModel: BetterRest
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("Desired amount of sleep")
				.font(.headline)
			
			Stepper(
				"\(domainModel.sleepAmountHrs.formatted()) hours",
				value: $domainModel.sleepAmountHrs,
				in: BetterRest.reasonableSleepAmountRangeHrs,
				step: 0.25
			)
		}
	}
}

struct BRSelectSleepAmountView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(BetterRest()) {
			BRSelectSleepAmountView(domainModel: $0)
		}
    }
}
