//
//  RPSGamePlayingView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSGamePlayingView: View {
	@Binding var game: RPSGame
	
    var body: some View {
		VStack {
			Group {
				Text("Computer move is")
					.font(RPSFont.LoraMedium)
					.foregroundColor(.white)
					.withLightShadow()
				
				RPSGestureImageView(
					gesture: game.computerRandomGesture
				)
				.frame(width: 120, height: 120)
			}
			
			
			Group {
				RPSGameModeView(mode: game.gameMode)
					.font(RPSFont.LoraLarge)
					.foregroundColor(.white)
					.withLightShadow()
				
				RPSGestureSelectionView(game: $game)
			}
		}
    }
}

struct RPSGamePlayingView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(RPSGame()) {
			RPSGamePlayingView(game: $0)
		}
		.preferredColorScheme(.dark)
	}
}
