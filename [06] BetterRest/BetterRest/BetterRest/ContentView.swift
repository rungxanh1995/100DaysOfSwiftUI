//
//  ContentView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-20.
//

import CoreML
import SwiftUI

struct ContentView: View {
	@State
	private var domainModel: BetterRest = BetterRest()
	
    var body: some View {
		
		NavigationView {
			Form {
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
				
				VStack(alignment: .leading, spacing: 0) {
					Text("Desired amount of sleep")
						.font(.headline)
					
					Stepper(
						"\(domainModel.sleepAmountHrs.formatted()) hours",
						value: $domainModel.sleepAmountHrs,
						in: domainModel.reasonableSleepAmountRangeHrs,
						step: 0.25
					)
				}
				
				VStack(alignment: .leading, spacing: 0) {
					Text("Daily coffee intake")
						.font(.headline)
					
					Stepper(
						domainModel.coffeeAmountCups == 1 ? "1 cup" : "\(domainModel.coffeeAmountCups) cups",
						value: $domainModel.coffeeAmountCups,
						in: 1...10
					)
				}
			}
			.navigationTitle("BetterRest")
			.toolbar {
				Button("Calculate") { domainModel.calculateBedtime() }
			}
			.alert(domainModel.alertTitle, isPresented: $domainModel.toShowAlert) {
				Button("OK") { }
			} message: { Text(domainModel.alertMessage) }
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
