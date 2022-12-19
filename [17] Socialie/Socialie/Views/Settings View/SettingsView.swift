//
//  SettingsView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

struct SettingsView: View {
	
	// MARK: - Preference properties
	@Preference(\.isHapticsEnabled)
	var isHapticsEnabled
	
	@Preference(\.systemTheme)
	var systemTheme
	
	var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("General")
				) {
					appTheme
				}
				.headerProminence(.increased)
				
				Section(
					header: Text("Contact Developer")
				) {
					HStack {
						Symbols.Images.twitter
						Link(
							"Twitter",
							destination: Constants.Url.personalTwitterLink
						)
					}
					
					HStack {
						Symbols.Images.github
						Link(
							"GitHub",
							destination: Constants.Url.personalGithubLink
						)
					}
				}
				.headerProminence(.increased)
			}
			.navigationTitle("Settings")
		}
	}
}

private extension SettingsView {
	@ViewBuilder
	private var appTheme: some View {
		Picker("Color Theme", selection: $systemTheme) {
			ForEach(SchemeType.allCases) { (theme) in
				Text(theme.title)
					.tag(theme.rawValue)
			}
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
