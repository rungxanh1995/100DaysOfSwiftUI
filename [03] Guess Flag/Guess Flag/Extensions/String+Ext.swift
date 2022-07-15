//
//  String+Ext.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

extension String {
	
	/// Generate localized version of the string, assuming the project has been set up to support multiple localizations
	func localized() -> String {
		return NSLocalizedString(
			self,
			tableName: "Localizable",
			bundle: .main,
			value: self,
			comment: self
		)
	}
}
