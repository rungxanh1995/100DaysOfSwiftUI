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
	static let reasonableSleepAmountRangeHrs: ClosedRange<Double> = 4...12
	
	var coffeeAmountCups = 1
	static let reasonableCoffeeIntakeCups: ClosedRange<Int> = 1...10

	/// The very bedtime solution to app users
	var suggestedBedtime: Date { calculateBedtime() }
	
	private func calculateBedtime() -> Date {
		var suggestedBedtime: Date = Date.now
		getBedtimeAndHandleErrors(for: &suggestedBedtime)
		return suggestedBedtime
	}
	
	private func getBedtimeAndHandleErrors(for bedtime: inout Date) {
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
			
			bedtime = desiredWakeUpTime - bedtimePrediction.actualSleep
		} catch { }
	}
}
