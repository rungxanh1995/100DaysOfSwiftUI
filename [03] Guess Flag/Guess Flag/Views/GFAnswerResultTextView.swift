//
//  GFAnswerResultTextView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-27.
//

import SwiftUI

struct GFAnswerResultTextView: View {
	@Binding
	var game: GuessFlagGame
	
	var body: some View {
		Text(game.answerResultMessage)
			.font(.headline)
			.foregroundColor(.white)
			.opacity(game.animateFlagsAfterEachGuess ? 1 : 0)
	}
}

struct GFCorrectAnswerTextView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(GuessFlagGame()) {
			GFAnswerResultTextView(game: $0)
		}
    }
}
