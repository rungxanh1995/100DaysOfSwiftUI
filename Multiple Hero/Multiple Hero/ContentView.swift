//
//  ContentView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct ContentView: View {
	@State
	private var isAskingForSettings = true  // start game with settings view
	@State
	private var isGameActuallyActive = false
	
	private let reasonableMultiplicationRange: ClosedRange<Int> = 2...12
	@State
	private var selectedMultiplicationTable: Int = 2
	
	private let questionsToBeAskedOptions: [Int] = [5, 10, 20]
	@State
	private var questionsToBeAskedPosition: Int = 5
	
	var body: some View {
		
		// Swap views in this VStack
		VStack {
			if isAskingForSettings {
				VStack(spacing: 20) {
					Text("Multiplication Hero")
						.font(.largeTitle)
					tablesUpToView
					questionsToBeAskedView
					playButton
				}
				.padding(.horizontal, 20)
			}
			
			if isGameActuallyActive {
				// Player is actively playing
				gamePlayingView
			}
		}
	}
	
	@ViewBuilder
	private var tablesUpToView: some View {
		HStack {
			Text("Tables up to:")
			Spacer()
			Stepper("\(selectedMultiplicationTable)", value: $selectedMultiplicationTable, in: reasonableMultiplicationRange)
		}
	}
	
	@ViewBuilder
	private var questionsToBeAskedView: some View {
		HStack {
			Text("Num of questions:")
			Spacer()
			Picker("Number of questions", selection: $questionsToBeAskedPosition, content: {
				ForEach(questionsToBeAskedOptions, id: \.self) {
					Text("\($0)")
				}
			})
			.pickerStyle(.segmented)
		}
	}
	
	@ViewBuilder
	private var playButton: some View {
		Button("Play") {
			withAnimation(.easeInOut(duration: 0.5)) {
				isAskingForSettings.toggle()
				isGameActuallyActive.toggle()
			}
		}
		.buttonStyle(.borderedProminent)
	}
	
	@ViewBuilder
	private var gamePlayingView: some View {
		Text("Game playing view here")
			.transition(
				.asymmetric(insertion: .scale, removal: .opacity)
			)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
