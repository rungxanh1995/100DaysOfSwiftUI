//
//  String+Ext.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

extension String {
	
	/// The localized string key of this string,
	/// to pass into supported SwiftUI views so that you get a translated version
	var localizedKey: LocalizedStringKey {
		LocalizedStringKey(self)
	}
}
