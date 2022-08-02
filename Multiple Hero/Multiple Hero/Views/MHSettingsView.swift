//
//  MHSettingsView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHSettingsView: View {
	
	@Binding
	var game: MHGame
	
    var body: some View {
		VStack(spacing: 20) {
			Text("Multiplication Hero")
				.font(.largeTitle)
			selectUpperboundForTablesView
			selectNumberOfQuestionsView
			playButton
		}
		.padding(.horizontal, 20)
    }
	
	@ViewBuilder
	private var selectUpperboundForTablesView: some View {
		HStack {
			Text("Tables up to:")
			Spacer()
			Stepper("\(game.selectedMultiplicationTable)", value: $game.selectedMultiplicationTable, in: MHGame.reasonableMultiplicationRange)
		}
	}
	
	@ViewBuilder
	private var selectNumberOfQuestionsView: some View {
		HStack {
			Text("Num of questions:")
			Spacer()
			Picker("Number of questions", selection: $game.maxQuestionsEachGame, content: {
				ForEach(MHGame.numberOfQuestionsOptions, id: \.self) {
					Text("\($0)")
				}
			})
			.pickerStyle(.segmented)
		}
	}
	
	@ViewBuilder
	private var playButton: some View {
		Button("Play") {
			withAnimation(.easeInOut(duration: 0.5)) {
				game.isAskingForSettings.toggle()
				game.isGameActive.toggle()
				game.generateNewQuestions()
			}
		}
		.buttonStyle(.borderedProminent)
	}
}

struct MHSettingsView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(MHGame()) { MHSettingsView(game: $0) }
    }
}
