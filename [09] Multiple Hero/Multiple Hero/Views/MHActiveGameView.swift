//
//  MHActiveGameView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHActiveGameView: View {
	
	@EnvironmentObject
	var game: MHGame
	
	@State
	private var animationAmount = 1.0
	
    var body: some View {
        gamePlayingView
    }
	
	@ViewBuilder
	private var gamePlayingView: some View {
		VStack {
			if game.isGameActive {
				
				gameMascotView
				miniScoreView
					.padding(.bottom, 50)
				
				ZStack {
					currentQuestionAwaitingAnswerView
					happyEmojiView
					sadEmojiView
				}
				
				MHKeypadView() { action in
					MHKeypadActionHandler(currentGame: game)
						.didTapButton(perform: action)
				}
			}
			else {
				VStack {
					roundEndScoreView
					playAgainButtonView
				}
			}
		}
		.onAppear(perform: generateQuestions)
	}
}

extension MHActiveGameView {
	
	@ViewBuilder
	private var gameMascotView: some View {
		Image(game.randomMascotName)
			.shadow(radius: 5, x: 0, y: 5)
			.padding(.bottom, 20)
			.wiggling()
	}
	
	@ViewBuilder
	private var miniScoreView: some View {
		VStack(spacing: 0) {
			Text("You got")
				.font(.system(.body, design: .rounded).bold())
				.foregroundColor(.primary)
			
			HStack {
				Text("\(game.userProgress.score)")
				Text(game.userProgress.score > 1 ? "points" : "point")
			}
			.font(.system(.title, design: .rounded).bold())
				.foregroundColor(.primary)
		}
		.foregroundColor(.white)
		.padding()
		.background(.thinMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 30))
		.shadow(radius: 5)
	}
	
	@ViewBuilder
	private var currentQuestionAwaitingAnswerView: some View {
		HStack {
			Text(game.getCurrentQuestion().questionString)
				.foregroundColor(.orange)
			Text(game.playerAnswer.isEmpty ? "..." : game.playerAnswer)
				.foregroundColor(.mint)
		}
		.font(.system(size: 48, weight: .bold, design: .rounded))
		.shadow(radius: 5, x: 0, y: 5)
	}
	
	@ViewBuilder
	private var roundEndScoreView: some View {
		let scoreString = "\(game.userProgress.score)/\(game.maxQuestionsEachGame)"
		VStack {
			Text("🎉")
				.font(.system(size: 80))
			
			HStack {
				
				Text("Scored")
					.foregroundColor(.orange)
				Text(scoreString)
					.foregroundColor(.mint)
			}
		}
		.font(.system(size: 48, weight: .bold, design: .rounded))
		.shadow(radius: 5, x: 0, y: 5)
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
		MHButtonView(buttonText: "Play Again") {
			withAnimation(.easeInOut(duration: 0.5)) {
				game.reset()
			}
		}
	}
	
	private func generateQuestions() {
		game.generateNewQuestions()
		game.resetCurrentQuestion()
		game.isGameActive = true
	}
	
}

struct MHActiveGameView_Previews: PreviewProvider {
    static var previews: some View {
		MHActiveGameView()
			.environmentObject(MHGame())
    }
}
