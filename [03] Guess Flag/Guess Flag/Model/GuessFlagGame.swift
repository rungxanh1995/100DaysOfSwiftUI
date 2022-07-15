//
//  GuessFlagGame.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation

/// Host and control the logic of the game
struct GuessFlagGame {
	private var countries = CountryModelStore.defaultStore
	private var randomCorrectAnswer: Int = 0
	var correctCountryNameAnswer: String { countries.element(randomCorrectAnswer).name }
	let numberOfFlagsShown = 3
	
	var isScoreAlertShown: Bool = false
	var scoreAlertTitle: String = ""
	
	mutating func checkFlagGuess(position flagPosition: Int) {
		scoreAlertTitle = (flagPosition == randomCorrectAnswer) ? "Correct" : "Wrong"
		isScoreAlertShown = true
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
