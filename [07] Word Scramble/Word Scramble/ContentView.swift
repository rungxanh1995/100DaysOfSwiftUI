//
//  ContentView.swift
//  Word Scramble
//
//  Created by Joe Pham on 2022-07-22.
//

import SwiftUI

// Task: sẽ dùng UITextChecker
// nên mình sẽ tạo 1 wrapper class hoặc struct để bớt decoupling

struct ContentView: View {
	@State
	private var game = WSGame(rootWord: "")

	@State
	private var newWord = ""
	
	
    var body: some View {
		NavigationView {
			List {
				Section(
					header: Text("Root word")
				) {
					WSRootWordView(game: $game)
				}
				
				Section(
					header: Text("Your answer"),
					footer: Text("Must be a word created only from letters of the root word")
				) {
					TextField("Enter your new word", text: $newWord)
						.autocapitalization(.none)
				}
				
				Section {
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
		game.userAnswer = newWord.cleanedAndLowercased()
		
		// validation for answer here
		guard game.answerPassedValidations() else {
			return
		}
		
		withAnimation {
			game.usedWords.insert(game.userAnswer, at: 0)
		}
		newWord = ""
	}
	
	
	func startGame() {
		game.rootWord = WSPreparer.generateRandomRootWord()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
