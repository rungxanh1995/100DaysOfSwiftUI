//
//  SettingsViewModel.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-24.
//

import SwiftUI

extension SettingsView {
	final class ViewModel: ObservableObject {
		@AppStorage(UserDefaultsKey.hapticsEnabled)
		var isHapticsEnabled: Bool = true
		
		@AppStorage(UserDefaultsKey.systemTheme)
		var systemTheme: Int = SchemeType.allCases.first!.rawValue
		
		@Published
		var isConfirmingResetData: Bool = false
		
		let twitterLink: URL = URL(string: "https://twitter.com/rungxanh1995")!
		let githubLink: URL = URL(string: "https://github.com/rungxanh1995")!
		
		init() { }
		
		/// Reset app data
		func resetDefaults() {
			let defaults = UserDefaults.standard
			let dictionary = defaults.dictionaryRepresentation()
			dictionary.keys.forEach { key in
				defaults.removeObject(forKey: key)
			}
		}
	}
}
