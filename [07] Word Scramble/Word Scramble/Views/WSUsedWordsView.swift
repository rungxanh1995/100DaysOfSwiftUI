	//
	//  WSUsedWordsView.swift
	//  Word Scramble
	//
	//  Created by Joe Pham on 2022-07-25.
	//

import SwiftUI

struct WSUsedWordsView: View {
	@Binding
	var game: WSGame
	
	var body: some View {
		ForEach(game.usedWords, id: \.self) { usedWord in
			HStack {
				Text(usedWord)
				Spacer()
				Text("Word length")
					.foregroundColor(.secondary)
					.font(.body.italic())
				Image(systemName: "\(usedWord.count).circle.fill")
			}
		}
	}
}

struct WSUsedWordsView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(
			WSGame(rootWord: WSPreparer.generateRandomRootWord())
		) {
			WSUsedWordsView(game: $0)
		}
	}
}
