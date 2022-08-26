//
//  SettingsView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-26.
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
						Symbols.link
						Link(
							"Twitter",
							destination: Constants.Links.personalTwitterLink
						)
					}
					
					HStack {
						Symbols.link
						Link(
							"GitHub",
							destination: Constants.Links.personalTwitterLink
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
		.tint(.indigo)
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

