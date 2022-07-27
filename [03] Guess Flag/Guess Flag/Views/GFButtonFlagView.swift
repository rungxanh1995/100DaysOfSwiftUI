//
//  GFButtonFlagView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-27.
//

import SwiftUI

struct GFButtonFlagView: View {
	@Binding
	var game: GuessFlagGame
	
	private(set) var positionInStack: Int
	
	/// Help to control flipping animation of the flag button
	/// Should be initially set at 0.0 so the flag stays flat on surface
	@State
	private(set) var flippedDegree: Double = 0.0
	
	/// Disable interactions of a flag to prevent auto next question bug
	private var isDisabled: Bool {
		game.animateFlagsAfterEachGuess ? true : false
	}
	
	var body: some View {
		let onlyYAxis: (x: CGFloat, y: CGFloat, z: CGFloat) = (x: 0, y: 1, z: 0)
		
		Button {
			game.checkFlagGuess(position: positionInStack)
			withAnimation(
				.interpolatingSpring(stiffness: 25.0, damping: 5.0)
			) {
				flippedDegree += 360
				game.animateFlagsAfterEachGuess.toggle()
				
				waitThenAskNewQuestion()
			}
		} label: {
			Image(game.getCountryName(at: positionInStack))
				.renderingMode(.original)
		}
		.clipShape(Capsule())
		.shadow(radius: 5, y: 5)
		.rotation3DEffect(
			.degrees(flippedDegree),
			axis: onlyYAxis
		)
		.opacity(decideOpacityAmount())
		.scaleEffect(decideScaleAmount())
		.disabled(isDisabled)
    }
}

extension GFButtonFlagView {
	// Could've had this in game struct.
	// However, game is a struct and immutable.
	// So I couldn't call this method directly in it.
	private func waitThenAskNewQuestion() {
		let waitDelay = 3.0
		DispatchQueue.main.asyncAfter(deadline: .now() + waitDelay) {
			game.askNewQuestion()
		}
	}

	private func decideOpacityAmount() -> Double {
		let fullyOpaque = 1.0
		let translucent = 0.25
		
		switch game.animateFlagsAfterEachGuess {
			case true:
				if game.isCorrectFlagGuess(at: positionInStack) {
					return fullyOpaque
				} else {
					return translucent
				}
			case false:
				return fullyOpaque
		}
	}
	
	private func decideScaleAmount() -> Double {
		let original = 1.0
		let scaledDown = 0.75
		
		switch game.animateFlagsAfterEachGuess {
			case true:
				if game.isCorrectFlagGuess(at: positionInStack) {
					return original
				} else {
					return scaledDown
				}
			case false:
				return original
		}
	}
}

struct GFButtonFlagView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(GuessFlagGame()) {
			GFButtonFlagView(game: $0, positionInStack: 0)
		}
    }
}
