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
	
	// MARK: - Validation functions
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
	
}
