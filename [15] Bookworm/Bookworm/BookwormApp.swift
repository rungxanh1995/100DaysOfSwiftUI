//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-20.
//

import SwiftUI

@main
struct BookwormApp: App {
	
    var body: some Scene {
        WindowGroup {
			TabView {
				HomeView()
					.tabItem {
						Symbols.house
						Text("Home")
					}
				SettingsView()
					.tabItem {
						Symbols.gear
						Text("Settings")
					}
			}
			.setUpColorTheme()
        }
    }
}
