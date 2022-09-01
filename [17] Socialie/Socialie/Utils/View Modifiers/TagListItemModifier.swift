//
//  TagListItemModifier.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

/// Modify a `Text` to look like a tag chip item,
/// making use of `Button` for a built-in appearance.
struct TagListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		Button {
			// no action
		} label: {
			content
				.font(.callout)
				.padding(8)
				.background(Color.accentColor.opacity(0.25))
				.clipShape(Capsule())
		}
	}
}
