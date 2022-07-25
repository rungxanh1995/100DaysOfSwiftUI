//
//  WSEntireView.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-22.
//

import SwiftUI

struct WSEntireView: View {
	@State
	private var game = WSGame(rootWord: "")

	@State
	private var userAnswer = ""
	
	
    var body: some View {
		NavigationView {
			List {
				Section(
					header: Text("Root word")
				) {
					WSRootWordView(game: $game)
					WSUserScoreView(game: $game)
				}
				
				Section(
					header: Text("Your answer"),
					footer: Text("Must be a word created only from letters of the root word")
				) {
					TextField("Enter your new word", text: $userAnswer)
						.autocapitalization(.none)
				}
				
				Section {
					WSUsedWordsView(game: $game)
				}
			}
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.navigationTitle("Word Scramble")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar(content: {
				Button(action: startGame) {
					Label("New Root Word", systemImage: "shuffle")
				}
				.buttonStyle(.bordered)
				.tint(.mint)
			})
			.alert(game.errorTitle, isPresented: $game.showingError) {
				Button("OK", role: .cancel) { }
			} message: {
				Text(game.errorMessage)
			}
		}
    }
	
	private func addNewWord() {
		game.userAnswer = userAnswer.cleanedAndLowercased()
		
		// validation for answer here
		guard game.answerPassedValidations() else { return }
		
		withAnimation {
			game.usedWords.insert(game.userAnswer, at: 0)
		}
		userAnswer = ""
	}
	
	private	func startGame() {
		game.rootWord = WSPreparer.generateRandomRootWord()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		WSEntireView()
	}
}
