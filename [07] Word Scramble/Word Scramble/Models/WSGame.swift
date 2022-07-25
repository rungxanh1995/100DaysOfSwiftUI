//
//  WSGame.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import Foundation

struct WSGame {
	
	var rootWord: String
	var userAnswer: String = ""
	var usedWords: [String] = []
	
	private(set) var errorTitle = ""
	private(set) var errorMessage = ""
	var showingError = false
	
	// MARK: - Validation functions
	mutating func answerPassedValidations() -> Bool {
		guard answerHasAtLeast3Chars() else {
			setAlert(title: "Short answer", message: "Try another answer with at least 3 characters")
			return false
		}
		
		guard answerDoesNotMatchRootWord() else {
			setAlert(title: "Same as root word", message: "Can't just cheat using the root word, my friend")
			return false
		}
		
		guard answerIsNotAlreadyUsed() else {
			setAlert(title: "Word used already", message: "Be more original")
			return false
		}
		
		guard answerHasLettersFromRootWord() else {
			setAlert(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
			return false
		}
		
		guard answerIsRealInEnglish() else {
			setAlert(title: "Word not recognized", message: "You can't just make them up, you know!")
			return false
		}
		
		return true
	}
	
	func answerHasAtLeast3Chars() -> Bool {
		let validator = WSValidator(rootWord: rootWord, usedWords: usedWords)
		return validator.hasAtLeast(charCount: 3, word: userAnswer)
	}
	
	func answerDoesNotMatchRootWord() -> Bool {
		let validator = WSValidator(rootWord: rootWord, usedWords: usedWords)
		return validator.isNotRootWord(userAnswer)
	}
	
	func answerIsNotAlreadyUsed() -> Bool {
		let validator = WSValidator(rootWord: rootWord, usedWords: usedWords)
		return validator.isOriginal(userAnswer)
	}

	func answerHasLettersFromRootWord() -> Bool {
		let validator = WSValidator(rootWord: rootWord, usedWords: usedWords)
		return validator.isPossible(word: userAnswer)
	}
	
	func answerIsRealInEnglish() -> Bool {
		let validator = WSValidator(rootWord: rootWord, usedWords: usedWords)
		return validator.isReal(userAnswer, in: "en")
	}
	
	// MARK: - Error alert
	mutating func setAlert(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}
