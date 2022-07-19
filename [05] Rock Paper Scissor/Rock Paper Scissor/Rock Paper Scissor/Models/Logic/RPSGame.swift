	//
	//  RPSGame.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-16.
	//

import Foundation

	/// Manages the specific game logic
struct RPSGame {
	
	static let allGestures: [RPSGestureType] = RPSGestureStore.defaultStore
	private(set) var computerRandomGesture: RPSGestureType = RPSGame.allGestures.randomElement()!
	private(set) var gameMode: RPSGameMode = RPSGameMode.allCases.randomElement()!
	
	static let maxQuestionsEachGame: Int = 10
	var numGuessesEachGame: Int = 0
	var userScore: Int = 0
	
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
			// code
		return false
	}
	
	mutating func askNewQuestion() {
			// code
	}
	
	mutating func reset() {
			// code
	}
	
	mutating func updateScore(basedOn guessResult: Bool) {
			// code
	}
}
