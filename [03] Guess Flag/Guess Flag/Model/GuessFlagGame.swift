//
//  GuessFlagGame.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation
import SwiftUI

/// Host and control the logic of the game
struct GuessFlagGame: QuizGameProtocol {
	private var countries = CountryModelStore.defaultStore
	var correctCountryNameAnswer: String { countries.element(randomCorrectAnswer).name }
	static let numberOfFlagsShown = 3
	private var randomCorrectAnswer: Int = Int.random(in: 0..<numberOfFlagsShown)
	
	var isAnswerResultShown: Bool = false
	private(set) var answerResultMessage: LocalizedStringKey = ""
	
	internal static let maxQuestionsEachGame = 8
	internal var numGuessesEachGame = 0
	private(set) var userScore = 0
	
	var animateFlagsAfterEachGuess: Bool = false
	
	mutating func checkFlagGuess(position flagPosition: Int) {
		numGuessesEachGame += 1
		
		guard checkIfGameOver() == false else {
			return
		}
		
		updateOngoingGame(basedOn: isCorrectFlagGuess(at: flagPosition))
	}
	
	func isCorrectFlagGuess(at flagPosition: Int) -> Bool {
		return flagPosition == randomCorrectAnswer
	}
		
	func checkIfGameOver() -> Bool {
		if numGuessesEachGame <= GuessFlagGame.maxQuestionsEachGame {
			return false
		} else {
			return true
		}
	}
	
	mutating private func updateOngoingGame(basedOn isCorrectGuess: Bool) {
		if isCorrectGuess {
			updateAlertContent(
				message: "🎉"
			)
		} else {
			updateAlertContent(
				message: "\(Text("Correct answer was")) \(randomCorrectAnswer + 1)"
			)
		}
		updateScore(basedOn: isCorrectGuess)
		isAnswerResultShown = true
	}
	
	mutating private func updateAlertContent(message: LocalizedStringKey) {
		answerResultMessage = message
	}
	
	mutating internal func updateScore(basedOn guessResult: Bool) {
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
		animateFlagsAfterEachGuess = false
	}
	
	private func getRandomCorrectAnswer() -> Int {
		Int.random(in: 0..<GuessFlagGame.numberOfFlagsShown)
	}
	
	func getCountryName(at index: Int) -> String {
		countries.element(index).name
	}
	
	/// Reset the game back to starting state.
	/// Call this method in a closure, within the braces to work.
	mutating func reset() {
		userScore = 0
		numGuessesEachGame = 0
		askNewQuestion()
	}
}
