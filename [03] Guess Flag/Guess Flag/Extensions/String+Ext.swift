//
//  String+Ext.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

extension String {
	
	func localized() -> LocalizedStringKey {
		return LocalizedStringKey(self)
	}
}
