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
	
    var body: some View {
		Button {
			game.checkFlagGuess(position: positionInStack)
		} label: {
			Image(game.getCountryName(at: positionInStack))
				.renderingMode(.original)
		}
		.clipShape(Capsule())
		.shadow(radius: 5, y: 5)
    }
}

struct GFButtonFlagView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(GuessFlagGame()) {
			GFButtonFlagView(game: $0, positionInStack: 0)
		}
    }
}
