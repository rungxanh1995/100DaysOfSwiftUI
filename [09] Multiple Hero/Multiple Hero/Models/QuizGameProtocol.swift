//
//  QuizGameProtocol.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-16.
//

import Foundation

/// Basic properties and functionalities that a quiz game should have
protocol QuizGameProtocol {
	
	// MARK: Properties
	var maxQuestionsEachGame: Int { get set }
	var numGuessesEachGame: Int { get set }
	var userProgress: UserProgress { get }
	
	// MARK: Functionality
	func checkIfGameOver() -> Bool
	
	mutating func askNewQuestion() -> Void
	
	/// Start a new round of game
	mutating func reset() -> Void
	
	mutating func updateScore(basedOn guessResult: Bool) -> Void
}
