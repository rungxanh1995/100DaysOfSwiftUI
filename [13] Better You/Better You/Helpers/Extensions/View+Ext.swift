//
//  View+Ext.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-24.
//

import SwiftUI

extension View {
	/// Configure the color theme of this application.
	func setUpColorTheme() -> some View {
		modifier(SchemeModifier())
	}
}
