//
//  GFGameAreaView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFGameAreaView: View {
	@Binding var game: GuessFlagGame
	
	var body: some View {
		Group {
			if game.checkIfGameOver() == false {
				GFGameOngoingView(game: $game)
			} else {
				GFGameOverView(game: $game)
			}
		}
		.frame(maxWidth: .infinity)
		.padding(.vertical, 20)
		.background(.thinMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 20))
	}
}
