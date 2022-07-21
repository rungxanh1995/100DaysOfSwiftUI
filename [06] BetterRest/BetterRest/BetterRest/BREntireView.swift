//
//  ContentView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-20.
//

import CoreML
import SwiftUI

struct BREntireView: View {
	@State
	private var domainModel: BetterRest = BetterRest()
	
    var body: some View {
		
		NavigationView {
			Form {
				BRSelectWakeUpTimeView(domainModel: $domainModel)
				
				BRSelectSleepAmountView(domainModel: $domainModel)
				
				BRSelectCoffeeIntakeView(domainModel: $domainModel)
				
				Section(header: Text("Suggested bedtime")) {
					HStack {
						Spacer()
						BRSuggestedBedtimeView(
							bedtime: domainModel.suggestedBedtime
						)
						Spacer()
					}
				}
			}
			.navigationTitle("BetterRest")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BREntireView()
    }
}
