//
//  String+Ext.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-07.
//

import Foundation

extension String {
	
	/// Force generate localized version of the string, used as a workaround for edge cases
	/// like a raw String value of an enum case
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
