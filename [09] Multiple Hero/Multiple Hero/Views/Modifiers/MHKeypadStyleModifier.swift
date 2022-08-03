//
//  MHKeypadStyleModifier.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHKeypadStyle: ViewModifier {
	var width: CGFloat
	var height: CGFloat
	var tintColor: Color = .orange
	
	func body(content: Content) -> some View {
		content
			.font(.title)
			.frame(maxWidth: width, maxHeight: height)
			.foregroundColor(.white)
			.background(tintColor)
			.clipShape(RoundedRectangle(cornerRadius: 25))
	}
}
