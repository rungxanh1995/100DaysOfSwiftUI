//
//  View+Ext.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-19.
//

import SwiftUI

extension View {
	func withLightShadow(of color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33)) -> some View {
		modifier(RPSShadowModifier(color: color))
	}
}
