//
//  MHActiveGameView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHActiveGameView: View {
	
	@Binding
	var game: MHGame
	
    var body: some View {
        gamePlayingView
    }
	
	@ViewBuilder
	private var gamePlayingView: some View {
		VStack {
			// TODO: Add score view here
			
			Spacer()
				.frame(
					minWidth: 0,
					maxWidth: .infinity,
					minHeight: 0,
					maxHeight: .infinity,
					alignment: .top
				)
			ZStack {
				HStack {
					if game.isGameActive {
						Text(game.questions[game.currentQuestion].questionString)
							.foregroundColor(.orange)
						Text(game.playerAnswer.isEmpty ? "?" : game.playerAnswer)
							.foregroundColor(.mint)
					}
					// TODO: Check this part
					else {
						Text("Score ")
							.foregroundColor(.orange)
						Text("\(game.userScore)/\(game.questions.count)")
							.foregroundColor(.mint)
					}
				}
				.font(.system(size: 64, design: .rounded))
				
				Text("🥳")
					.font(.largeTitle)
					.foregroundColor(game.animatingIncreaseScore ? .green : .clear)
					.opacity(game.animatingIncreaseScore ? 0 : 1)
					.offset(x: 0, y: game.animatingIncreaseScore ? -100 : -75)
				
				Text("😭")
					.font(.largeTitle)
					.foregroundColor(game.animatingDecreaseScore ? .red : .clear)
					.opacity(game.animatingDecreaseScore ? 0 : 1)
					.offset(x: 0, y: game.animatingDecreaseScore ? 100 : 75)
			}
			.foregroundStyle(.regularMaterial)
			
			MHKeypadView() { action in
				MHKeypadActionHandler(game: $game)
					.didTapButton(perform: action)
			}
		}
		.onAppear(perform: generateQuestions)
	}
}

extension MHActiveGameView {
	
	private func generateQuestions() {
		game.generateNewQuestions()
		game.currentQuestion = 0
		game.isGameActive = true
	}
	
}

struct MHActiveGameView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(MHGame()) { MHActiveGameView(game: $0) }
    }
}
