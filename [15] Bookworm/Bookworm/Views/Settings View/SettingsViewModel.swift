//
//  SettingsViewModel.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-26.
//

import CoreData
import SwiftUI

extension SettingsView {
	final class ViewModel: ObservableObject {
		@AppStorage(UserDefaultsKey.hapticsEnabled)
		var isHapticsEnabled: Bool = true
		
		@AppStorage(UserDefaultsKey.systemTheme)
		var systemTheme: Int = SchemeType.allCases.first!.rawValue
		
		init() { }
	}
}
