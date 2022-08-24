	//
	//  RPSGame.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-16.
	//

import SwiftUI

	/// Manages the specific game logic
struct RPSGame {
	
	static let allGestures: [RPSGestureType] = RPSGestureStore.defaultStore
	private(set) var computerRandomGesture: RPSGestureType = RPSGame.allGestures.randomElement()!
	private(set) var gameMode: RPSGameMode = RPSGameMode.allCases.randomElement()!
	
	static let maxQuestionsEachGame: Int = 10
	var numGuessesEachGame: Int = 0
	var userScore: Int = 0
	
	var isScoreAlertShown: Bool = false
	private(set) var scoreAlert: RPSAlert = RPSAlert()
	
	mutating func playerSelectedAnswer(_ answer: RPSGestureType) {
		numGuessesEachGame += 1
		
		guard checkIfGameOver() == false else {
			updateForGameOver()
			return
		}
		
		let whetherAnswerIsCorrect = isCorrectAnswer(playerMove: answer)
		updateOngoingGame(basedOn: whetherAnswerIsCorrect)
	}
	
	
	mutating private func updateForGameOver() {
		scoreAlert.updateContent(
			title: "Game Over",
			message: "Maximum questions reached!"
		)
		isScoreAlertShown = true
	}
	
	mutating private func updateOngoingGame(basedOn isCorrectGuess: Bool) {
		if isCorrectGuess {
			haptic(.success)
			scoreAlert.updateContent(
				title: "Correct",
				message: "🎉"
			)
		} else {
			haptic(.error)
			scoreAlert.updateContent(
				title: "Wrong",
				message: "😵"
			)
		}
		updateScore(basedOn: isCorrectGuess)
		askNewQuestion()
		isScoreAlertShown = true
	}
	
	
	
	func isCorrectAnswer(playerMove: RPSGestureType) -> Bool {
		if gameMode == .playToWin {
			return isWinner(between: playerMove, against: computerRandomGesture)
		} else {
			return isWinner(between: computerRandomGesture, against: playerMove)
		}
		
	}
	
	private func isWinner(between winningMove: RPSGestureType, against losingMove: RPSGestureType) -> Bool {
		switch winningMove {
			case .rock:
				return losingMove == .scissor
			case .paper:
				return losingMove == .rock
			case .scissor:
				return losingMove == .paper
		}
	}
	
	
}

extension RPSGame: QuizGameProtocol {
	func checkIfGameOver() -> Bool {
		if numGuessesEachGame <= RPSGame.maxQuestionsEachGame {
			return false
		} else {
			return true
		}
	}
	
	mutating internal func askNewQuestion() {
		computerRandomGesture = RPSGame.allGestures.randomElement()!
		gameMode = RPSGameMode.allCases.randomElement()!
	}
	
	mutating func reset() {
		userScore = 0
		numGuessesEachGame = 0
		askNewQuestion()
	}
	
	mutating internal func updateScore(basedOn guessResult: Bool) {
		if guessResult == true {
			userScore += 1
		} else {
			userScore = max(0, userScore - 1)
		}
	}
}
