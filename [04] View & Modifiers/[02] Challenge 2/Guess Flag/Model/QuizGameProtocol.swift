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
	static var maxQuestionsEachGame: Int { get }
	var numGuessesEachGame: Int { get set }
	var userScore: Int { get }
	
	// MARK: Functionality
	func checkIfGameOver() -> Bool
	
	mutating func askNewQuestion() -> Void
	
	/// Start a new round of game
	mutating func reset() -> Void
	
	mutating func updateScore(basedOn guessResult: Bool) -> Void
}
