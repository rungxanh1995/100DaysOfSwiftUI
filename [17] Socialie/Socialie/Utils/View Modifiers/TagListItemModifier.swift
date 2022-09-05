//
//  TagListItemModifier.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

/// Modify a `Text` to look like a tag chip item
struct TagListItemModifier: ViewModifier {
	@Environment(\.colorScheme)
	fileprivate var colorScheme
	
	fileprivate var highlightColor: Color {
		switch colorScheme {
			case .light:
				return .accentColor.opacity(0.15)
			case .dark:
				return .accentColor.opacity(0.2)
			@unknown default:
				return .clear
		}
	}
	
	func body(content: Content) -> some View {
		content
			.font(.callout)
			.padding(8)
			.foregroundColor(Color.accentColor)
			.background(highlightColor)
			.clipShape(Capsule())
	}
}
