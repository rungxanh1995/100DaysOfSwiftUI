//
//  TagListItemModifier.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

/// Modify a `Text` to look like a tag chip item
struct TagListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.callout)
			.padding(8)
			.foregroundColor(Color.accentColor)
			.background(Color.accentColor.opacity(0.25))
			.clipShape(Capsule())
	}
}
