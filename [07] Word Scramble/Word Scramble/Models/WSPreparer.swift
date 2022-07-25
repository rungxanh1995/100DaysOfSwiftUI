//
//  WSPreparer.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import Foundation

struct WSPreparer {
	
	private static let resourceFilename: String = "start"
	private static let resourceFileExt: String = "txt"
	private static let fallbackRootWord: String = "silkworm"
	
	static func generateRandomRootWord() -> String {
		guard let startWords = try? String(contentsOf: Self.findResourceUrl()!) else {
			return fallbackRootWord
		}
		
		let allWords = startWords.components(separatedBy: "\n")
		return allWords.randomElement() ?? fallbackRootWord
	}
	
	private static func findResourceUrl() -> URL? {
		guard let url = Bundle.main.url(forResource: Self.resourceFilename, withExtension: Self.resourceFileExt) else {
			fatalError("Could not load \(Self.resourceFilename).\(Self.resourceFileExt) from bundle.")
		}
		
		return url
	}
}
