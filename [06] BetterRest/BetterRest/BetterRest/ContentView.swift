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
	private var desiredWakeUpTime = Self.defaultWakeUpTime
	
	static var defaultWakeUpTime: Date {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? Date.now
	}
	
	@State
	private var sleepAmountHrs = 8.0
	
	let reasonableSleepAmountRangeHrs: ClosedRange<Double> = 4...12
	
	@State
	private var coffeeAmountCups = 1
	
	@State
	private var alertTitle: LocalizedStringKey = ""
	@State
	private var alertMessage: LocalizedStringKey = ""
	@State
	private var toShowAlert: Bool = false
	
    var body: some View {
		
		NavigationView {
			Form {
				VStack(alignment: .leading, spacing: 0) {
					Text("When do you want to wake up?")
						.font(.headline)
					
					DatePicker(
						"Enter a wake up time",
						selection: $desiredWakeUpTime,
						displayedComponents: .hourAndMinute
					)
					.labelsHidden()
				}
				
				VStack(alignment: .leading, spacing: 0) {
					Text("Desired amount of sleep")
						.font(.headline)
					
					Stepper(
						"\(sleepAmountHrs.formatted()) hours",
						value: $sleepAmountHrs,
						in: reasonableSleepAmountRangeHrs,
						step: 0.25
					)
				}
				
				VStack(alignment: .leading, spacing: 0) {
					Text("Daily coffee intake")
						.font(.headline)
					
					Stepper(
						coffeeAmountCups == 1 ? "1 cup" : "\(coffeeAmountCups) cups",
						value: $coffeeAmountCups,
						in: 1...10
					)
				}
			}
			.navigationTitle("BetterRest")
			.toolbar {
				Button("Calculate", action: calculateBedtime)
			}
			.alert(alertTitle, isPresented: $toShowAlert) {
				Button("OK") { }
			} message: { Text(alertMessage) }
		}
	}
	
	func calculateBedtime() {
		do {
			let mlConfig = MLModelConfiguration()
			let actualSleepCalculator = try ActualSleepTrainedCalculator(configuration: mlConfig)
			
			let wakeUpDateComponents = Calendar.current.dateComponents([.hour, .minute], from: desiredWakeUpTime)
			let wakeUpHourInSecondsFromMidnight = (wakeUpDateComponents.hour ?? 8) * 60 * 60
			let wakeUpMinuteInSecondsFromMidnight = (wakeUpDateComponents.minute ?? 0) * 60
			let wakeUpSecondsFromMidnight = wakeUpHourInSecondsFromMidnight + wakeUpMinuteInSecondsFromMidnight
			
			let bedtimePrediction = try actualSleepCalculator.prediction(
				wake: Double(wakeUpSecondsFromMidnight),
				estimatedSleep: sleepAmountHrs,
				coffee: Double(coffeeAmountCups)
			)
			
			let suggestedBedtime = desiredWakeUpTime - bedtimePrediction.actualSleep
			
			
			alertTitle = "Suggested bedtime is"
			alertMessage = "\(suggestedBedtime.formatted(date: .omitted, time: .shortened))"
		} catch {
			alertTitle = "Error"
			alertMessage = "Something wrong happened calculating bedtime"
		}
		
		toShowAlert = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
