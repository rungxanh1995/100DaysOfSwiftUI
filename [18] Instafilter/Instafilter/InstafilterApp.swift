//
//  InstafilterApp.swift
//  Instafilter
//
//  Created by Joe Pham on 2022-09-05.
//

import SwiftUI

@main
struct InstafilterApp: App {
	init() {
		// Workaround to fix Apple's buggy alert tint color
		UIView.appearance().tintColor = UIColor(named: "AccentColor")
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
