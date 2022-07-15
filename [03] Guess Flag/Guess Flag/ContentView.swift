//
//  ContentView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct ContentView: View {
	@State
	private var game = GuessFlagGame()
	
	var body: some View {
		ZStack {
			LinearGradient(
				gradient: Gradient(colors: [.yellow, .blue, .indigo]), startPoint: .top, endPoint: .bottomTrailing
			)
			.ignoresSafeArea()
			
			VStack {
				
				VStack {
					Text("Tap flag of")
					Text(game.correctCountryNameAnswer)
				}
				.foregroundStyle(.primary)
				
				ForEach(0..<game.numberOfFlagsShown, id: \.self) { eachFlag in
					Button {
						game.checkFlagGuess(position: eachFlag)
					} label: {
						Image(game.getCountryName(at: eachFlag))
							.renderingMode(.original)
					}
					.clipShape(RoundedRectangle(cornerRadius: 25))
				}
			}
		}
		.alert(
			game.scoreAlertTitle,
			isPresented: $game.isScoreAlertShown
		) {
			Button(
				"Continue",
				action: { game.askNewQuestion() }
			)
		} message: {
			Text("Your score is ...")
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
