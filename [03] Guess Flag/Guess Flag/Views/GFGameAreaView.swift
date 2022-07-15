//
//  GFGameAreaView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFGameAreaView: View {
	@Binding var game: GuessFlagGame
	
	var body: some View {
		VStack(spacing: 20) {
			VStack {
				Text("Tap flag of")
					.font(.subheadline.weight(.heavy))
					.foregroundStyle(.secondary)
				
				let localizedCountryName = game.correctCountryNameAnswer.localized()
				Text(localizedCountryName)
					.font(.largeTitle.weight(.semibold))
			}
			
			ForEach(0..<game.numberOfFlagsShown, id: \.self) { eachFlag in
				Button {
					game.checkFlagGuess(position: eachFlag)
				} label: {
					Image(game.getCountryName(at: eachFlag))
						.renderingMode(.original)
				}
				.clipShape(Capsule())
				.shadow(radius: 5, y: 5)
			}
		}
		.frame(maxWidth: .infinity)
		.padding(.vertical, 20)
		.background(.thinMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 20))
	}
}
