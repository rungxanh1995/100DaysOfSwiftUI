//
//  SocialieApp.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

@main
struct SocialieApp: App {
	
	init() {
		// Configure segmented picker colouring
		UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.accentColor)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.accentColor)], for: .normal)
	}
	
    var body: some Scene {
        WindowGroup {
			TabView {
				HomeView()
					.tabItem {
						Symbols.Images.house
						Text("Home")
					}
				SettingsView()
					.tabItem {
						Symbols.Images.gear
						Text("Settings")
					}
			}
			.setUpColorTheme()
        }
    }
}
