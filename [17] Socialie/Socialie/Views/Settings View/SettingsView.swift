//
//  SettingsView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

struct SettingsView: View {
	@StateObject
	private var viewModel: ViewModel
	
	init(viewModel: SettingsView.ViewModel = .init()) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("General")
				) {
					haptics
					appTheme
				}
				
				Section(
					header: Text("Contact Developer")
				) {
					HStack {
						Symbols.Images.link
						Link(
							"Twitter",
							destination: Constants.Url.personalTwitterLink
						)
					}
					
					HStack {
						Symbols.Images.link
						Link(
							"GitHub",
							destination: Constants.Url.personalGithubLink
						)
					}
				}
			}
			.navigationTitle("Settings")
		}
	}
}

private extension SettingsView {
	@ViewBuilder
	private var haptics: some View {
		Toggle(
			"Enable Haptics",
			isOn: $viewModel.isHapticsEnabled
		)
		.tint(.accentColor)
	}
	
	@ViewBuilder
	private var appTheme: some View {
		Picker("Color Theme", selection: $viewModel.systemTheme) {
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
