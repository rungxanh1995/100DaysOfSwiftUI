//
//  UserProgress.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-03.
//

import Foundation

class UserProgress {
	private(set) var score: Int = 0
	private(set) var currentQuestion: Int = 0
	
	func resetScore() -> Void {
		score = 0
	}
	
	func incrementScore() -> Void {
		score += 1
	}
	
	func resetCurrentQuestion() -> Void {
		currentQuestion = 0
	}
	
	func incrementCurrentQuestion() -> Void {
		currentQuestion += 1
	}
}
