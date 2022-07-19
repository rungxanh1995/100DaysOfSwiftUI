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
	
	@State
	var playerScore = 0
	
	var body: some View {
		ZStack {
			RPSBackgroundView(mode: currentGame.gameMode)
				.statusBar(hidden: true)
			
			// TODO: Keep this for later use
			/*
			if currentGame.checkIfGameOver() == false {
				RPSGamePlayingView()
			} else {
				RPSGameOverView(game: currentGame)
			}
			 */
			
			VStack {
				Spacer()
				RPSRibbonHeaderView()
				Spacer()
				Spacer()
				RPSGamePlayingView(game: $currentGame)
				Spacer()
				RPSScoreView(score: currentGame.userScore)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RPSEntireGameView()
	}
}
