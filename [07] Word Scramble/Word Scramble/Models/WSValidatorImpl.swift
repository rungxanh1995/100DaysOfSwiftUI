//
//  WSValidatorImpl.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import Foundation

/// Implementation struct of WSValidator.
///
/// Validate a user's answer to a randomly suggested root word.
struct WSValidatorImpl: WSValidator {
	
	let rootWord: String
	let usedWords: [String]
	
	func hasAtLeast(charCount: Int, word: String) -> Bool {
		return word.count >= charCount
	}
	
	func isNotRootWord(_ word: String) -> Bool {
		return word != rootWord
	}
	
		/// Check whether the word has been used before or not
	func isOriginal(_ word: String) -> Bool {
		!usedWords.contains(word)
	}
	
		/// Check whether a random word can be made out of the available letters from the root word
		/// and remove each matching letter so it can't be used twice
	func isPossible(word: String) -> Bool {
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
	
	func isReal(_ word: String, in language: String) -> Bool {
		let spellChecker = WSSpellchecker(wordToCheck: word, languageCode: language)
		return spellChecker.wordSpelledCorrectly()
	}
}

