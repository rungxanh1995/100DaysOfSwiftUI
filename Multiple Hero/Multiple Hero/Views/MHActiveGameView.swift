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
	
	@State
	private var animationAmount = 1.0
	
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
				if game.isGameActive {
					currentQuestionAwaitingAnswerView
				}
				// TODO: Check this part to display score view on round over
				else {
					VStack {
						roundEndScoreView
						playAgainButtonView
					}
				}
				
				happyEmojiView
				sadEmojiView
			}
			
			MHKeypadView() { action in
				MHKeypadActionHandler(game: $game)
					.didTapButton(perform: action)
			}
		}
		.onAppear(perform: generateQuestions)
	}
}

extension MHActiveGameView {
	
	@ViewBuilder
	private var currentQuestionAwaitingAnswerView: some View {
		HStack {
			Text(game.getCurrentQuestion().questionString)
				.foregroundColor(.orange)
			Text(game.playerAnswer.isEmpty ? "..." : game.playerAnswer)
				.foregroundColor(.mint)
		}
		.font(.system(size: 64, design: .rounded))
		.padding()
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.overlay(
			RoundedRectangle(cornerRadius: 25)
				.stroke(.orange)
				.scaleEffect(animationAmount)
				.opacity(2 - animationAmount)
				.animation(
					.easeInOut(duration: 0.75)
					.repeatForever(autoreverses: true),
					value: animationAmount
				)
		)
		.onAppear {
			animationAmount = 2
		}
	}
	
	@ViewBuilder
	private var roundEndScoreView: some View {
		let scoreString = "\(game.userScore)/\(game.questions.count)"
		HStack {
			Text("Scored")
				.foregroundColor(.orange)
			Text(scoreString)
				.foregroundColor(.mint)
		}
		.font(.system(size: 64, design: .rounded))
	}
	
	@ViewBuilder
	private var happyEmojiView: some View {
		Text("🥳")
			.font(.largeTitle)
			.foregroundColor(game.animatingIncreaseScore ? .green : .clear)
			.opacity(game.animatingIncreaseScore ? 0 : 1)
			.offset(x: 0, y: game.animatingIncreaseScore ? -100 : -20)
	}
	
	@ViewBuilder
	private var sadEmojiView: some View {
		Text("😭")
			.font(.largeTitle)
			.foregroundColor(game.animatingDecreaseScore ? .red : .clear)
			.opacity(game.animatingDecreaseScore ? 0 : 1)
			.offset(x: 0, y: game.animatingDecreaseScore ? 100 : 20)
	}
	
	@ViewBuilder
	private var playAgainButtonView: some View {
		Button("Play Again") {
			game.reset()
		}
		.font(.system(.title, design: .rounded).bold())
		.padding()
		.buttonStyle(.borderedProminent)
		.clipShape(RoundedRectangle(cornerRadius: 12))
		.tint(.teal)
	}
	
	private func generateQuestions() {
		game.generateNewQuestions()
		game.resetCurrentQuestion()
		game.isGameActive = true
	}
	
}

struct MHActiveGameView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(MHGame()) { MHActiveGameView(game: $0) }
    }
}
