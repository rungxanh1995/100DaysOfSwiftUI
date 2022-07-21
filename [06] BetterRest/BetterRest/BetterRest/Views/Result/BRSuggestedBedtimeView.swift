//
//  BRSuggestedBedtimeView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-21.
//

import SwiftUI

struct BRSuggestedBedtimeView: View {
	var bedtime: Date
	
    var body: some View {
		HStack {
			Text("You should hit the bed at")
			Spacer()
			Text(bedtime.formatted(date: .omitted, time: .shortened))
		}
    }
}

struct SuggestedBedtimeView_Previews: PreviewProvider {
    static var previews: some View {
		BRSuggestedBedtimeView(bedtime: Date.now)
    }
}
