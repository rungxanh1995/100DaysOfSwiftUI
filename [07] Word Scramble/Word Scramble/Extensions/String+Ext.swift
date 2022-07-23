//
//  String+Ext.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-22.
//

import SwiftUI

extension String {
	
	func cleanedAndLowercased() -> Self {
		return self
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.lowercased()
	}
}
