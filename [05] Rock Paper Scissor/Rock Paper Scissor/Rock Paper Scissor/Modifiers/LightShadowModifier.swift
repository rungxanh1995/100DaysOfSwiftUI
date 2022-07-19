//
//  LightShadowModifier.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-19.
//

import SwiftUI

struct LightShadowModifier: ViewModifier {
	private(set) var color: Color = .black
	
	func body(content: Content) -> some View {
		return content
			.shadow(color: color, radius: 5, x: 0, y: 5)
	}
}
