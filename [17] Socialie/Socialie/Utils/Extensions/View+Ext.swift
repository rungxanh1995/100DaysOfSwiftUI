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
}
