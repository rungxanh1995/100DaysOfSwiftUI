//
//  Better_YouApp.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import SwiftUI

@main
struct Better_YouApp: App {
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
