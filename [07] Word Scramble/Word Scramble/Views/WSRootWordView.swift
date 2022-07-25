//
//  WSRootWordView.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-25.
//

import SwiftUI

struct WSRootWordView: View {
	@Binding
	var game: WSGame
	
    var body: some View {
		HStack {
			Spacer()
			Text(game.rootWord)
				.font(.title)
				.foregroundColor(.primary)
			Spacer()
		}
    }
}

struct WSRootWordView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(
			WSGame(rootWord: WSPreparer.generateRandomRootWord())
		) {
			WSRootWordView(game: $0)
		}
        
    }
}
