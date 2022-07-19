//
//  View+Ext.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-19.
//

import SwiftUI

extension View {
	func withLightShadow(of color: Color = .black) -> some View {
		modifier(LightShadowModifier(color: color))
	}
}
