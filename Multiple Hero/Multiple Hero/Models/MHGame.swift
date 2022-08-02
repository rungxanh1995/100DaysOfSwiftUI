//
//  MHGame.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import Foundation

struct MHGame: QuizGameProtocol {
	
	var isAskingForSettings = true  // start game with settings view
	var isGameActive = false
	
	static let reasonableMultiplicationRange: ClosedRange<Int> = 2...12
	var selectedMultiplicationTable: Int = 2
	
	static let numberOfQuestionsOptions: [Int] = [5, 10, 20]
	internal var maxQuestionsEachGame: Int = 5
	internal var numGuessesEachGame: Int = 0
	
	private(set) var questions: [MHQuestion] = []
	private(set) var currentQuestion = 0
	
	var playerAnswer = ""
	var userScore: Int = 0
	
	var animatingIncreaseScore = false
	var animatingDecreaseScore = false
	
	mutating func generateNewQuestions() -> Void {
		questions = MHQuestion.allQuestions(
			tablesUpTo: selectedMultiplicationTable,
			numQuestions: maxQuestionsEachGame
		)
	}
	
	func getCurrentQuestion() -> MHQuestion {
		// Questions should be pre-generated when game started
		return questions.element(at: currentQuestion)!
	}
	
	mutating func resetCurrentQuestion() -> Void {
		self.currentQuestion = 0
	}
	
	mutating func incrementCurrentQuestion() -> Void {
		self.currentQuestion += 1
	}
	
	func checkIfGameOver() -> Bool {
		// code here
		if currentQuestion < questions.count - 1 {
			return false
		} else {
			return true
		}
	}
	
	mutating func askNewQuestion() {
		// code here
	}
	
	mutating func reset() {
		// code here
	}
	
	mutating func updateScore(basedOn guessResult: Bool) {
		// code here
	}
}
