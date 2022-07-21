//
//  BRSelectWakeUpTimeView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-21.
//

import SwiftUI

struct BRSelectWakeUpTimeView: View {
	@Binding
	var domainModel: BetterRest
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("When do you want to wake up?")
				.font(.headline)
			
			DatePicker(
				"Enter a wake up time",
				selection: $domainModel.desiredWakeUpTime,
				displayedComponents: .hourAndMinute
			)
			.labelsHidden()
		}
    }
}

struct BRSelectWakeUpTimeView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(BetterRest()) {
			BRSelectWakeUpTimeView(domainModel: $0)
		}
    }
}
