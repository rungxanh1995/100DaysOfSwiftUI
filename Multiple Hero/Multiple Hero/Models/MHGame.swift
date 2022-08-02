//
//  MHGame.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import Foundation

struct MHGame {
	var isAskingForSettings = true  // start game with settings view
	var isGameActive = false
	
	static let reasonableMultiplicationRange: ClosedRange<Int> = 2...12
	var selectedMultiplicationTable: Int = 2
	
	static let numberOfQuestionsOptions: [Int] = [5, 10, 20]
	var selectedNumberOfQuestions: Int = 5
	
	private(set) var questions: [MHQuestion] = []
	var currentQuestion = 0
	
	var playerAnswer = ""
	var score = 0
	
	var animatingIncreaseScore = false
	var animatingDecreaseScore = false
	
	mutating func generateNewQuestions() -> Void {
		questions = MHQuestion.allQuestions(
			tablesUpTo: selectedMultiplicationTable,
			numQuestions: selectedNumberOfQuestions
		)
	}
}
