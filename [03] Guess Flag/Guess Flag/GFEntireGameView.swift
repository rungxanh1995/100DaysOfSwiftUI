//
//  GFEntireGameView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct GFEntireGameView: View {
	@State
	private var game = GuessFlagGame()
	
	var body: some View {
		ZStack {
			GFBackgroundView()
				.ignoresSafeArea()
				.statusBar(hidden: true)
			
			VStack {
				Spacer()
				
				GFGameTitleView()
				
				GFGameAreaView(game: $game)
				
				Spacer()
				Spacer()
				
				if game.checkIfGameOver() == false {
					GFScoreView(score: game.userScore)
					GFAnswerResultTextView(game: $game)
				} else {
					Spacer()
				}
				
				Spacer()
			}
			.padding()
			.shadow(radius: 5)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		GFEntireGameView()
	}
}
