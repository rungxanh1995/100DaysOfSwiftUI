//
//  ContentView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct ContentView: View {

	@StateObject
	private var currentGame: MHGame = MHGame()
	
	var body: some View {
		ZStack {
			MHBackgroundView()
				.ignoresSafeArea()
				.statusBar(hidden: true)

			Group {
				if currentGame.isAskingForSettings {
					MHSettingsView()
				} else {
					// Player is actively playing
					MHActiveGameView()
				}
			}
		}
		.environmentObject(currentGame)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
