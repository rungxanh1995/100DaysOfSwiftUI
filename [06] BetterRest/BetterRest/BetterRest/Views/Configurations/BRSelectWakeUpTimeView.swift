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
		HStack {
			Text("Wake up time:")
			
			Spacer()
			
			DatePicker(
				"Enter a desired wake up time",
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
