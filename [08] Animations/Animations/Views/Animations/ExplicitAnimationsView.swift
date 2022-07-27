//
//  ExplicitAnimationsView.swift
//  Animations
//
//  Created by Joe Pham on 2022-07-26.
//

import SwiftUI

struct ExplicitAnimationsView: View {
	@State
	private var animationAmount = 1.0
	
    var body: some View {
		Button("Tap Me") {
			withAnimation(
				.interpolatingSpring(stiffness: 5, damping: 1)
				.repeatCount(3, autoreverses: true)
			) {
				animationAmount += 360
			}
		}
		.padding(50)
		.foregroundColor(.white)
		.background(.mint)
		.clipShape(Circle())
		.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationsView()
    }
}
