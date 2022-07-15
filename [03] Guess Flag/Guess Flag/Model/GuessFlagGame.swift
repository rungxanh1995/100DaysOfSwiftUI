//
//  GuessFlagGame.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation
import SwiftUI

/// Host and control the logic of the game
struct GuessFlagGame {
	private var countries = CountryModelStore.defaultStore
	private var randomCorrectAnswer: Int = 0
	var correctCountryNameAnswer: String { countries.element(randomCorrectAnswer).name }
	let numberOfFlagsShown = 3
	
	var isScoreAlertShown: Bool = false
	var scoreAlertTitle: LocalizedStringKey = ""
	var scoreAlertMessage: LocalizedStringKey = ""
	private var userScore = 0
	var currentScore: Int {
		get {
			userScore
		}
	}
	
	mutating func checkFlagGuess(position flagPosition: Int) {
		let isCorrectGuess = (flagPosition == randomCorrectAnswer) ? true : false
		if isCorrectGuess {
			updateAlertContent(
				title: "Correct",
				message: "🎉"
			)
		} else {
			updateAlertContent(
				title: "Wrong",
				message: "\(Text("Correct answer was")) \(randomCorrectAnswer + 1)"
			)
		}
		updateScore(basedOn: isCorrectGuess)
		isScoreAlertShown = true
	}
	
	mutating private func updateAlertContent(title: LocalizedStringKey, message: LocalizedStringKey) {
		scoreAlertTitle = title
		scoreAlertMessage = message
	}
	
	mutating private func updateScore(basedOn guessResult: Bool) {
		if guessResult == true {
			userScore += 1
		} else {
			userScore = max(0, userScore - 1)
		}
	}

	/// Call this method in a closure, within the braces to work
	mutating func askNewQuestion() {
		countries.shuffle()
		randomCorrectAnswer = getRandomCorrectAnswer()
	}
	
	private func getRandomCorrectAnswer() -> Int {
		Int.random(in: 0..<numberOfFlagsShown)
	}
	
	func getCountryName(at index: Int) -> String {
		countries.element(index).name
	}
	
}
