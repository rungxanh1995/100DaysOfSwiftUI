//
//  Constants.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

enum Constants {
	internal enum Url {
		/// API URL string of source JSON to fetch
		static let friendfaceURLString: String = "https://www.hackingwithswift.com/samples/friendface.json"
		
		static let personalTwitterLink: URL = URL(string: "https://twitter.com/rungxanh1995")!
		static let personalGithubLink: URL = URL(string: "https://github.com/rungxanh1995")!
	}
	
	internal enum Persistence {
		static let dataModelName: String = "Socialie"
	}
}
