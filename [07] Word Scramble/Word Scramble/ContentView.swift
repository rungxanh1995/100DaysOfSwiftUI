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
	private var usedWords = [String]()
	@State
	private var rootWord = ""
	@State
	private var newWord = ""
	
	@State
	private var errorTitle = ""
	@State
	private var errorMessage = ""
	@State
	private var showingError = false
	
    var body: some View {
		NavigationView {
			List {
				Section {
					TextField("Enter a new word", text: $newWord)
						.autocapitalization(.none)
				}
				
				Section {
					ForEach(usedWords, id: \.self) { usedWord in
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
			.navigationTitle(rootWord)
			.alert(errorTitle, isPresented: $showingError) {
				Button("OK", role: .cancel) { }
			} message: {
				Text(errorMessage)
			}
		}
    }
	
	private func addNewWord() {
		guard newWord.count > 0 else { return }
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		// validation for answer here
		guard isOriginal(word: answer) else {
			wordError(title: "Word used already", message: "Be more original")
			return
		}
		
		guard isPossible(word: answer) else {
			wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
			return
		}
		
		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
			return
		}
		
		withAnimation {
			usedWords.insert(answer, at: 0)
		}
		newWord = ""
	}
	
	func startGame() {
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			if let startWords = try? String(contentsOf: startWordsURL) {
				let allWords = startWords.components(separatedBy: "\n")
				rootWord = allWords.randomElement() ?? "silkworm"
				return
			}
		}
		
			// If were are *here* then there was a problem – trigger a crash and report the error
		fatalError("Could not load start.txt from bundle.")
	}
	
	
	/// Check whether the word has been used before or not
	private func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	
	/// Check whether a random word can be made out of the available letters from the root word
	/// and remove each matching letter so it can't be used twice
	private func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for character in word {
			if let matchedCharacterPosition = tempWord.firstIndex(of: character) {
				tempWord.remove(at: matchedCharacterPosition)
			} else {
				return false
			}
		}
		
		return true
	}
	
	private func isReal(word: String) -> Bool {
		let spellChecker = UITextChecker()
		let newWordRange = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = spellChecker.rangeOfMisspelledWord(
			in: word,
			range: newWordRange,
			startingAt: 0, wrap: false,
			language: "en"
		)
		
		return misspelledRange.location == NSNotFound
	}
	
	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
