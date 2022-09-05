//
//  CardModifier.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct CardModifier: ViewModifier {
	@Environment(\.colorScheme)
	fileprivate var colorScheme
	
	fileprivate var gradientColorOne: Color {
		switch colorScheme {
			case .light:
				return .accentColor.opacity(0.025)
			case .dark:
				return .accentColor.opacity(0.2)
			@unknown default:
				return .clear
		}
	}
	
	fileprivate var gradientColorTwo: Color {
		switch colorScheme {
			case .light:
				return .white.opacity(0.1)
			case .dark:
				return .clear
			@unknown default:
				return .clear
		}
	}
	
	func body(content: Content) -> some View {
		ZStack {
			LinearGradient(
				colors: [gradientColorOne, gradientColorTwo, gradientColorOne],
				startPoint: .topLeading,
				endPoint: .bottomTrailing
			)
			content
		}
			.frame(maxWidth: .infinity)
			.cornerRadius(10)
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(Color.accentColor.opacity(0.25)))
			.padding([.leading, .trailing])
	}
}
