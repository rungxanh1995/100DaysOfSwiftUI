//
//  GFGameOverView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFGameOverView: View {
	@Binding var game: GuessFlagGame
	
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
			.tint(Color("Dark indigo"))
			
			Spacer()
		}
    }
}
