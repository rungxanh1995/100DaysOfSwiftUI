//
//  MHSettingsView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHSettingsView: View {
	
	@EnvironmentObject
	var game: MHGame
	
    var body: some View {
		VStack(spacing: 20) {
			gameNameAndInstructionView
			Spacer()
			selectUpperboundForTablesView
			selectNumberOfQuestionsView
			playButton
			Spacer()
			introductoryTextView
		}
		.foregroundColor(.white)
		.padding(.horizontal, 20)
    }
}

extension MHSettingsView {
	
	@ViewBuilder
	private var gameNameAndInstructionView: some View {
		ZStack {
			// Matte glass effect
			Color.white.opacity(0.5)
				.clipShape(RoundedRectangle(cornerRadius: 20))
				.shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
				.blur(radius: 1)
			
			VStack {
				gameNameView
					.padding(.bottom, 20)
				settingInstructionTextView
			}
			.padding()
		}
		.foregroundColor(.black.opacity(0.8))
		.clipShape(RoundedRectangle(cornerRadius: 20))
		.shadow(radius: 5)
	}
	
	@ViewBuilder
	private var gameNameView: some View {
		Text("Multiple Hero")
			.font(.system(.largeTitle, design: .serif).bold())
			.multilineTextAlignment(.center)
	}
	
	@ViewBuilder
	private var selectUpperboundForTablesView: some View {
		HStack {
			Text("Tables up to:")
			Spacer()
			Stepper("\(game.selectedMultiplicationTable)", value: $game.selectedMultiplicationTable, in: MHGame.reasonableMultiplicationRange)
		}
		.font(.system(.headline, design: .rounded))
	}
	
	@ViewBuilder
	private var selectNumberOfQuestionsView: some View {
		HStack {
			Text("Questions:")
			Spacer()
			Picker("Number of questions", selection: $game.maxQuestionsEachGame, content: {
				ForEach(MHGame.numberOfQuestionsOptions, id: \.self) {
					Text("\($0)")
				}
			})
			.pickerStyle(.segmented)
		}
		.font(.system(.headline, design: .rounded))
	}
	
	@ViewBuilder
	private var playButton: some View {
		MHButtonView(
			buttonText: "Let's Play",
			tintColor: .black
		) {
			withAnimation(.easeInOut(duration: 0.5)) {
				game.isAskingForSettings.toggle()
				game.isGameActive.toggle()
				game.generateNewQuestions()
			}
		}
	}
	
	@ViewBuilder
	private var settingInstructionTextView: some View {
		Text(
"""
Choose your table limit and number of questions below, then tap "Let's Play" to start
"""
		)
		.font(.system(.body, design: .serif))
		.multilineTextAlignment(.center)
	}
	
	@ViewBuilder
	private var introductoryTextView: some View {
		Text(
"""
Multiple Hero is an 'edutainment' app for kids to help them practice multiplication tables – “what is 7 x 8?” and so on.
"""
		)
			.font(.system(.caption, design: .rounded))
			.foregroundStyle(.secondary)
			.multilineTextAlignment(.leading)
	}
}

struct MHSettingsView_Previews: PreviewProvider {
    static var previews: some View {
		MHSettingsView()
			.environmentObject(MHGame())
			.preferredColorScheme(.dark)
    }
}
