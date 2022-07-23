//
//  AnswerValidator.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-23.
//

import Foundation

protocol AnswerValidator {
	
	func hasPassedValidations(_ answer: String) -> Bool
	
	/// Check whether character count of the word is acceptable for an answer
	func isLongEnough(_ answer: String) -> Bool
	
	/// Check whether the word has been used before or not
	func isOriginal(_ answer: String) -> Bool
	
	/// Check whether the word can be
	/// made out of the available letters from the root word,
	/// and remove each matching letter so it can't be used twice
	func isPossible(_ answer: String) -> Bool
	
	/// Check whether the word is a real word in a language
	func isReal(_ answer: String) -> Bool
	
}
