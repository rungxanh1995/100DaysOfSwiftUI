//
//  WSUserScoreView.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import SwiftUI

struct WSUserScoreView: View {
	@Binding
	var game: WSGame
	
    var body: some View {
		HStack {
			Spacer()
			Text("You scored:")
			Text("\(game.userScore)")
				.bold()
				.foregroundColor(.mint)
			Spacer()
		}
    }
}

struct WSUserScoreView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(
			WSGame(rootWord: WSPreparer.generateRandomRootWord())
		) {
			WSUserScoreView(game: $0)
		}
        
    }
}
