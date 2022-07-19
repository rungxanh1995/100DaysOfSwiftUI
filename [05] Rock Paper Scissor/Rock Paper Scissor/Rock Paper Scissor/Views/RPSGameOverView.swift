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
			.font(.title.weight(.semibold))
			.foregroundStyle(.secondary)
			
			Group {
				Text("Your final score this round:") + Text(" \(game.userScore)")
			}
			.font(.body.weight(.semibold))
			.foregroundStyle(.secondary)
			
			Spacer()
			
			Button(
				"New Game",
				action: { game.reset() }
			)
			.buttonStyle(.borderedProminent)
			
			Spacer()
		}
	}
}
