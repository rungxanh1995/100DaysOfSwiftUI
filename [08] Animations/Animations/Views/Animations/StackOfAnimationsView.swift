//
//  StackOfAnimationsView.swift
//  Animations
//
//  Created by Joe Pham on 2022-07-26.
//

import SwiftUI

struct StackOfAnimationsView: View {
	@State
	private var isEnabled = false
	
    var body: some View {
		Button("Tap Me") {
			isEnabled.toggle()
		}
		.frame(width: 200, height: 200)
		.background(isEnabled ? .blue : .red)
		.animation(.default, value: isEnabled)
		.foregroundColor(.white)
		.clipShape(RoundedRectangle(cornerRadius: isEnabled ? 60 : 0))
		.animation(.interactiveSpring(), value: isEnabled)
    }
}

struct StackOfAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        StackOfAnimationsView()
    }
}
