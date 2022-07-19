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
			let computerMoveName = game.computerRandomGesture.rawValue
			Text("Computer move is \(computerMoveName)")
				.font(.body.weight(.bold))
				.foregroundColor(.black)
				.shadow(radius: 5, y: 5)
			
			RPSGestureImageView(
				gesture: game.computerRandomGesture
			)
			.frame(width: 120, height: 120)
			
			RPSGameModeView(mode: game.gameMode)
				.font(.title.weight(.semibold))
				.foregroundColor(.black)
				.shadow(radius: 5, y: 5)
			
			RPSGestureSelectionView(game: $game)
		}
    }
}

struct RPSGamePlayingView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(RPSGame()) {
			RPSGamePlayingView(game: $0)
		}
	}
}
