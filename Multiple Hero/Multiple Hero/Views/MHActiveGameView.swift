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
					roundEndScoreView
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
				.stroke(.orange, lineWidth: 2.0)
				.scaleEffect(animationAmount)
				.opacity(1.5 - animationAmount)
				.animation(
					.easeInOut(duration: 1)
					.repeatForever(autoreverses: true),
					value: animationAmount
				)
		)
		.animation(.easeInOut, value: animationAmount)
		.onAppear {
			animationAmount = 1.5
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
			.offset(x: 0, y: game.animatingIncreaseScore ? -100 : -75)
	}
	
	@ViewBuilder
	private var sadEmojiView: some View {
		Text("😭")
			.font(.largeTitle)
			.foregroundColor(game.animatingDecreaseScore ? .red : .clear)
			.opacity(game.animatingDecreaseScore ? 0 : 1)
			.offset(x: 0, y: game.animatingDecreaseScore ? 100 : 75)
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
