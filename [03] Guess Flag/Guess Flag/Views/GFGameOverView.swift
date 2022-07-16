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
			Text("Game Over")
				.font(.title.bold())
				.foregroundStyle(.secondary)
			
			Button(
				"New Game",
				action: { game.reset() }
			)
			.buttonStyle(.borderedProminent)
			.tint(Color("Toned maroon"))
		}
    }
}
