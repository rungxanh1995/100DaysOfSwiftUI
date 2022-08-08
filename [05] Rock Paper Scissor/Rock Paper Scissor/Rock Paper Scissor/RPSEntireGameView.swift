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
	private var isShowingHelpView = false
	
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
				HStack {
					gameplayInfoButton
						.offset(x: 20)
						
					Spacer()
					RPSScoreView(score: currentGame.userScore)
					Spacer()
					hiddenPlaceholderButton
				}
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
		.sheet(isPresented: $isShowingHelpView) {
			RPSGameplayHelpView()
		}
	}
}

private extension RPSEntireGameView {
	
	@ViewBuilder
	var gameplayInfoButton: some View {
		Button {
			isShowingHelpView.toggle()
		} label: {
			Image(systemName: "info.circle.fill")
				.font(.title)
				.foregroundColor(.white)
		}
	}
	
	/// A hidden button that does nothing,
	/// used as a workaround to center the score view at bottom of main game view
	@ViewBuilder
	var hiddenPlaceholderButton: some View {
		Button { } label: {
			Image(systemName: "face.smiling")
				.font(.title)
				.hidden()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RPSEntireGameView()
	}
}
