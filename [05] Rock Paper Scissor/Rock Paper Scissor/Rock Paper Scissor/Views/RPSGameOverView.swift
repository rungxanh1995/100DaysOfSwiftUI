//
//  RPSGameOverView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

// FIXME: Not done yet!
struct RPSGameOverView: View {
	@Binding var game: RPSGame
	
	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			Group {
				Text("Game Over")
				Text("🥳")
			}
			.font(RPSFont.LoraLarge)
			.foregroundStyle(.white)
			
			Group {
				Text("Your score this round:") + Text(" \(game.userScore)")
			}
			.font(RPSFont.LoraMedium)
			.foregroundStyle(.white)
			
			Spacer()
			
			Button(
				"New Game",
				action: { game.reset() }
			)
			.font(RPSFont.LoraSmall)
			.foregroundColor(.white)
			.tint(Color("Bright orange"))
			.buttonStyle(.borderedProminent)
			
			Spacer()
		}
		.foregroundStyle(.thinMaterial)
	}
}

struct GameOverView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(RPSGame()) {
			RPSGameOverView(game: $0)
		}
		.preferredColorScheme(.dark)
	}
}
