//
//  ContentView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct ContentView: View {
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
				
				GFScoreView(score: game.currentScore)
				
				Spacer()
			}
			.padding()
			.shadow(radius: 5)
		}
		.alert(
			game.scoreAlertTitle,
			isPresented: $game.isScoreAlertShown
		) {
			Button(
				"Continue",
				action: { game.askNewQuestion() }
			)
			Button(
				"Dismiss",
				role: .cancel,
				action: { }
			)
		} message: {
			Text(game.scoreAlertMessage)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
