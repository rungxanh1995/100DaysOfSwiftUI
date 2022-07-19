	//
	//  ContentView.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-16.
	//

import SwiftUI

struct RPSEntireGameView: View {
	
	@State
	private var currentGame: RPSGame = RPSGame()
	
	var body: some View {
		let isGameOver = currentGame.checkIfGameOver()
		
		ZStack {
			RPSBackgroundView(mode: currentGame.gameMode)
			
			VStack {
				RPSRibbonHeaderView()
				Spacer()
				if isGameOver == false {
					RPSGamePlayingView(game: $currentGame)
				} else {
					RPSGameOverView(game: $currentGame)
				}
				Spacer()
				RPSScoreView(score: currentGame.userScore)
			}
		}
		.alert(
			currentGame.scoreAlert.title,
			isPresented: $currentGame.isScoreAlertShown
		) {
			Button(
				isGameOver == false ? "Continue" : "Dismiss",
				action: { }
			)
		} message: {
			Text(currentGame.scoreAlert.message)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RPSEntireGameView()
	}
}
