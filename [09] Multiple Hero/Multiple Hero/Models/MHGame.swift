//
//  MHGame.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import Foundation

class MHGame: QuizGameProtocol, ObservableObject {
	
	@Published var isAskingForSettings = true  // start game with settings view
	@Published var isGameActive = false
	
	static let reasonableMultiplicationRange: ClosedRange<Int> = 2...12
	@Published var selectedMultiplicationTable: Int = 2
	
	static let numberOfQuestionsOptions: [Int] = [5, 10, 20]
	internal var maxQuestionsEachGame: Int = 5
	internal var numGuessesEachGame: Int = 0
	
	private(set) var randomMascotName = MHMascot.randomMascotName()
	private(set) var questions: [MHQuestion] = []
	
	@Published var playerAnswer = ""
	private(set) var userProgress: UserProgress = UserProgress()
	
	@Published var animatingIncreaseScore = false
	@Published var animatingDecreaseScore = false
	
	func generateNewQuestions() -> Void {
		questions = MHQuestion.allQuestions(
			tablesUpTo: selectedMultiplicationTable,
			numQuestions: maxQuestionsEachGame
		)
	}
	
	func getCurrentQuestion() -> MHQuestion {
		// Questions should be pre-generated when game started
		return questions.element(at: userProgress.currentQuestion)!
	}
	
	func resetCurrentQuestion() -> Void {
		userProgress.resetCurrentQuestion()
	}
	
	func checkIfGameOver() -> Bool {
		if userProgress.currentQuestion < questions.count - 1 {
			return false
		} else {
			return true
		}
	}
	
	func decideRoundIsOver() {
		if checkIfGameOver() == true {
			isGameActive = false
		}
	}
	
	func askNewQuestion() {
		userProgress.incrementCurrentQuestion()
	}
	
	func reset() -> Void {
		userProgress.resetScore()
		userProgress.resetCurrentQuestion()
		numGuessesEachGame = 0
		playerAnswer = ""
		
		isAskingForSettings = true
		isGameActive = false
		
		generateNewQuestions()
		getAnotherRandomMascotName()
	}
	
	func updateScore(basedOn guessResult: Bool) {
		if guessResult == true {
			userProgress.incrementScore()
		}
	}
	
	func getAnotherRandomMascotName() -> Void {
		randomMascotName = MHMascot.randomMascotName()
	}
}
