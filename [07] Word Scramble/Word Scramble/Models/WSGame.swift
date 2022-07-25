//
//  WSGame.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import UIKit

// TODO: Consider this a class if answerHasLettersFromWord() not working properly
struct WSGame {
	
	// TODO: Initialize root word
	var rootWord: String
	var userAnswer: String = ""
	var usedWords: [String] = []
	
	private(set) var errorTitle = ""
	private(set) var errorMessage = ""
	var showingError = false
	
	// MARK: - Validation functions
	mutating func answerPassedValidations() -> Bool {
		guard userAnswer.count >= 3 else {
			setAlert(title: "Short answer", message: "Try another answer with at least 3 characters")
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
	
	func answerIsNotAlreadyUsed() -> Bool {
		return isOriginal(userAnswer)
	}
	
	/// Check whether the word has been used before or not
	private func isOriginal(_ word: String) -> Bool {
		!usedWords.contains(word)
	}

	func answerHasLettersFromRootWord() -> Bool {
		return isPossible(word: userAnswer)
	}
	
	/// Check whether a random word can be made out of the available letters from the root word
	/// and remove each matching letter so it can't be used twice
	private func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for character in word {
			if let matchedCharacterPosition = tempWord.firstIndex(of: character) {
				tempWord.remove(at: matchedCharacterPosition)
			} else {
				return false
			}
		}
		
		return true
	}
	
	func answerIsRealInEnglish() -> Bool {
		return isReal(userAnswer, in: "en")
	}
	
	private func isReal(_ word: String, in language: String) -> Bool {
		// TODO: Refactor spellchecker to a wrapper class
		let spellChecker = UITextChecker()
		let newWordRange = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = spellChecker.rangeOfMisspelledWord(
			in: word,
			range: newWordRange,
			startingAt: 0, wrap: false,
			language: language
		)
		
		return misspelledRange.location == NSNotFound
	}
	
	// MARK: - Error alert
	mutating func setAlert(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}
