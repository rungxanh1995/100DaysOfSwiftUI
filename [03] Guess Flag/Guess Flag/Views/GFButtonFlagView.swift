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
	
    var body: some View {
		Button {
			game.checkFlagGuess(position: positionInStack)
			withAnimation(.easeInOut(duration: 0.75)) {
				flippedDegree += 360
			}
		} label: {
			Image(game.getCountryName(at: positionInStack))
				.renderingMode(.original)
		}
		.clipShape(Capsule())
		.shadow(radius: 5, y: 5)
		.rotation3DEffect(
			.degrees(flippedDegree),
			axis: (x: 0, y: 1, z: 0)
		)
    }
}

struct GFButtonFlagView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(GuessFlagGame()) {
			GFButtonFlagView(game: $0, positionInStack: 0)
		}
    }
}
