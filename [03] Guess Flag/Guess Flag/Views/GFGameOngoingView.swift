//
//  GFGameOngoingView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFGameOngoingView: View {
	@Binding var game: GuessFlagGame
	
    var body: some View {
		VStack(spacing: 20) {
			VStack {
				Text("Tap flag of")
					.font(.subheadline.weight(.heavy))
					.foregroundStyle(.secondary)
				
				Text(game.correctCountryNameAnswer.localizedKey)
					.font(.largeTitle.weight(.semibold))
			}
			
			ForEach(0..<GuessFlagGame.numberOfFlagsShown, id: \.self) { eachFlag in
				GFButtonFlagView(game: $game, positionInStack: eachFlag)
			}
		}
    }
}
