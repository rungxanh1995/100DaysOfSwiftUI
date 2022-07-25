//
//  WSSpellchecker.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import UIKit

/// Wrapper struct of spellcheker to reduce coupling
struct WSSpellchecker {
	
	private let spellchecker: UITextChecker = UITextChecker()
	
	private(set) var wordToCheck: String
	private(set) var languageCode: String
	
	func wordSpelledCorrectly() -> Bool {
		let newWordRange = NSRange(location: 0, length: wordToCheck.utf16.count)
		let misspelledRange = spellchecker.rangeOfMisspelledWord(
			in: wordToCheck,
			range: newWordRange,
			startingAt: 0, wrap: false,
			language: languageCode
		)
		
		return misspelledRange.location == NSNotFound
	}
	
}
