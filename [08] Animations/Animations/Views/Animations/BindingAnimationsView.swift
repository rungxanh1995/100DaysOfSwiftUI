//
//  BindingAnimationsView.swift
//  Animations
//
//  Created by Joe Pham on 2022-07-26.
//

import SwiftUI

struct BindingAnimationsView: View {
	@State
	private var animationAmount = 1.0
	
    var body: some View {
		VStack {
			Stepper(
				"Scale amount",
				value: $animationAmount.animation(),
				in: 1...10
			)
			
			Spacer()
			
			Button("Tap Me") {
				animationAmount += 1
			}
			.padding(40)
			.background(.red)
			.foregroundColor(.white)
			.clipShape(Circle())
			.scaleEffect(animationAmount)
		}
    }
}

struct BindingAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimationsView()
    }
}
