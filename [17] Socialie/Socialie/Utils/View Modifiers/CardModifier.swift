//
//  CardModifier.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct CardModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity)
			.background(.regularMaterial)
			.cornerRadius(10)
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(Color.accentColor.opacity(0.5)))
			.padding([.leading, .trailing])
			
	}
}
