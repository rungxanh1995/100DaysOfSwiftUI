//
//  String+Ext.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-12.
//

import Foundation

extension String {
	
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
