//
//  DarkModeModifier.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-23.
//	From Stack Overflow: https://stackoverflow.com/a/62990794/13349144
//

import SwiftUI

public struct DarkModeViewModifier: ViewModifier {
	
	@AppStorage(UserDefaultsKey.darkModeEnabled)
	var isDarkMode: Bool = true
	
	public func body(content: Content) -> some View {
		content
			.environment(\.colorScheme, isDarkMode ? .dark : .light)
			.preferredColorScheme(isDarkMode ? .dark : .light) // tint on status bar
	}
}
