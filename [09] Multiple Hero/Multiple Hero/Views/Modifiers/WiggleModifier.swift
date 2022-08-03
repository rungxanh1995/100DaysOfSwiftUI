//
//  WiggleModifier.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import SwiftUI

struct WiggleModifier: ViewModifier {
	@State private var isWiggling = false
	
	private static func randomize(interval: TimeInterval, withVariance variance: Double) -> TimeInterval {
		let random = (Double(arc4random_uniform(1000)) - 500.0) / 500.0
		return interval + variance * random
	}
	
	private let rotateAnimation = Animation
		.easeInOut(
			duration: WiggleModifier.randomize(
				interval: 0.25,
				withVariance: 0.025
			)
		)
		.repeatForever(autoreverses: true)
	
	func body(content: Content) -> some View {
		content
			.rotationEffect(.degrees(isWiggling ? 5.0 : -5.0))
			.animation(rotateAnimation)
			.onAppear() { isWiggling.toggle() }
	}
}
