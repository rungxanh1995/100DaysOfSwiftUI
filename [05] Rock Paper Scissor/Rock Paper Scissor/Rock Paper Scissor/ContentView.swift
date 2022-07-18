//
//  ContentView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-16.
//

import SwiftUI

struct ContentView: View {
	
	let allMoves = RPSMovesStore.defaultStore
	let randomComputerChoice = Int.random(in: 0..<3)
	@State
	var shouldWinGameMode = Bool.random()
	@State
	var playerCurrentChoice = 0
	@State
	var playerScore = 0
	
	var body: some View {
		VStack {
			Group {
				Text("Player score: \(playerScore)")
				Text("Computer move: \(allMoves[randomComputerChoice].name)")
				if shouldWinGameMode == true {
					Text("Game mode: You should win me")
				} else {
					Text("Game mode: You should lose to me")
				}
			}
			
			// FIXME: Very hairy game logic here
			// TODO: Refactor this snippet into the game model
			HStack {
				ForEach(allMoves, id: \.name) { eachMove in
					Button(eachMove.name) {
						print("You tapped: \(eachMove.name)")
						// TODO: Extracts opposite move here
						let oppositeMove = (shouldWinGameMode == true) ?
						RPSMovesStore.movesAndTheirOpponentsToWin[eachMove.name]! : RPSMovesStore.movesAndTheirOpponentsToLose[eachMove.name]!
						
						let verb = (shouldWinGameMode == true) ? "win" : "lose"
						print("To \(verb) me, your opposite move is: \(oppositeMove.name)")
					}
					.tint(.mint)
				}
			}
			.buttonStyle(.borderedProminent)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
