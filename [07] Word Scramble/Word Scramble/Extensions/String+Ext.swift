//
//  String+Ext.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-22.
//

import SwiftUI

/// Custom extensions to serve the game logic
extension String {
	
	/// Check whether the word has been used before or not
	func isNotAlreadyAnswered(in usedWords: [String]) -> Bool {
		return !usedWords.contains(self)
	}
	
	/// Check whether a word can be made out of the available letters from its root word
	/// then remove each matching letter so it can't be used twice
	func hasAllLettersTaken(from itsRootWord: String) -> Bool {
		var tempWord = itsRootWord
		
		for eachCharacter in tempWord {
			if let matchedIndex = tempWord.firstIndex(of: eachCharacter) {
				tempWord.remove(at: matchedIndex)
			} else {
				return false
			}
		}
		
		return true
	}
	
	/// Check whether a word is a real one in target language (passed in by its 2-character language code).
	/// For example, English language code is "en"
	func isARealWord(in languageCode: String) -> Bool {
		let spellChecker = UITextChecker()
		let newWordRange = NSRange(location: 0, length: self.utf16.count)
		let misspelledRange = spellChecker.rangeOfMisspelledWord(
			in: self,
			range: newWordRange,
			startingAt: 0, wrap: false,
			language: languageCode
		)
		
		return misspelledRange.location == NSNotFound
	}
}

extension String {
	
	func cleanedAndLowercased() -> Self {
		return self
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.lowercased()
	}
}
