//
//  SettingsViewModel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

extension SettingsView {
	final class ViewModel: ObservableObject {
		@Preference(\.isHapticsEnabled)
		var isHapticsEnabled
		
		@Preference(\.systemTheme)
		var systemTheme
		
		init() { }
	}
}
