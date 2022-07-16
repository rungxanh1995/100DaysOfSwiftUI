//
//  BigBlueTitleModifier.swift
//  Big Blue Title
//
//  Created by Joe Pham on 2022-07-16.
//

import SwiftUI

/// A custom ViewModifier that makes a view have a large, blue font suitable for prominent titles in a view.
struct BigBlueTitleModifier: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.largeTitle.bold())
			.foregroundColor(.white)
			.padding()
			.background(Color.blue)
			.clipShape(RoundedRectangle(cornerRadius: 12))
	}
}
