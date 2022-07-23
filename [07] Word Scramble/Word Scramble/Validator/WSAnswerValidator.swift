//
//  WSAnswerValidator.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-23.
//

import UIKit

struct WSAnswerValidator: AnswerValidator {
	
	private let MINIMUM_ANSWER_CHAR_COUNT: Int = 3
	private(set) var rootWord: String
	var usedWords = [String]()
	
	
	func hasPassedValidations(_ answer: String) -> Bool {
		return isLongEnough(answer) &&
		isOriginal(answer) &&
		isPossible(answer) &&
		isReal(answer)
	}
	
	func isLongEnough(_ answer: String) -> Bool {
		return answer.count > MINIMUM_ANSWER_CHAR_COUNT
	}
	
	func isOriginal(_ answer: String) -> Bool {
		return !usedWords.contains(answer)
	}
	
	func isPossible(_ answer: String) -> Bool {
		var tempWord = answer
		
		for character in tempWord {
			if let matchedCharacterPosition = tempWord.firstIndex(of: character) {
				tempWord.remove(at: matchedCharacterPosition)
			} else {
				return false
			}
		}
		
		return true
	}
	
	func isReal(_ answer: String) -> Bool {
		let spellChecker = UITextChecker()
		let newWordRange = NSRange(location: 0, length: answer.utf16.count)
		let misspelledRange = spellChecker.rangeOfMisspelledWord(
			in: answer,
			range: newWordRange,
			startingAt: 0, wrap: false,
			language: "en"
		)
		
		return misspelledRange.location == NSNotFound
	}
}
