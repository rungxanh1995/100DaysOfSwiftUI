//
//  WSValidator.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import Foundation

/// Validate a user's answer to a randomly suggested root word.
protocol WSValidator {
	
	func hasAtLeast(charCount: Int, word: String) -> Bool
	
	func isNotRootWord(_ word: String) -> Bool
	
	/// Check whether the word has been used before or not
	func isOriginal(_ word: String) -> Bool
	
	/// Check whether a random word can be made out of the available letters from the root word
	/// and remove each matching letter so it can't be used twice
	func isPossible(word: String) -> Bool
	
	func isReal(_ word: String, in language: String) -> Bool
}
