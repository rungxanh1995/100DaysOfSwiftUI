//
//  View+Ext.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

extension View {
	func asCard() -> some View {
		modifier(CardModifier())
	}
	
	/// Makes a view expand all the way within its parent view
	func expandToInfinity() -> some View {
		frame(
			minWidth: 0,
			maxWidth: .infinity,
			minHeight: 0,
			maxHeight: .infinity,
			alignment: .leading
		)
	}
	
	/// Modify a `Text` to look like a tag chip item
	func asTagChip() -> some View {
		modifier(TagListItemModifier())
	}
	
	/// Configure the color theme of this application.
	func setUpColorTheme() -> some View {
		modifier(SchemeModifier())
	}
}
