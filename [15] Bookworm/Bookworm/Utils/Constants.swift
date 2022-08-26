//
//  Constants.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-26.
//

import Foundation

enum Constants {
	static let bookGenresSorted: [String] = [
		"Programming",
		"Business",
		"Self-help",
		"Fantasy",
		"Horror",
		"Kids",
		"Mystery",
		"Poetry",
		"Romance",
		"Thriller",
		"Other"
	].sorted()
	
	internal enum Links {
		static let personalTwitterLink: URL = URL(string: "https://twitter.com/rungxanh1995")!
		static let personalGithubLink: URL = URL(string: "https://github.com/rungxanh1995")!
	}
}
