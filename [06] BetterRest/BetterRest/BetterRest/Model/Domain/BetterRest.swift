//
//  BetterRest.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-21.
//

import CoreML
import SwiftUI

/// Host domain logic of the app, whose properties include 3 main information:
/// a desired wake up time for the user,
/// how much time of sleep they want to have,
/// and how many generic cups of coffee they took that day
struct BetterRest {
	
	var desiredWakeUpTime = Self.defaultWakeUpTime
	
	static var defaultWakeUpTime: Date {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? Date.now
	}
	
	var sleepAmountHrs = 8.0
	
	let reasonableSleepAmountRangeHrs: ClosedRange<Double> = 4...12
	
	var coffeeAmountCups = 1
	
	private(set) var alertTitle: LocalizedStringKey = ""
	private(set) var alertMessage: LocalizedStringKey = ""
	var toShowAlert: Bool = false
	
	mutating func calculateBedtime() {
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
