//
//  SettingsView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-23.
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
					footer: Text("Be careful, this removes all your habit trackers! Restart the app to see changes")
				) {
					resetAppButton
				}
			}
			.navigationTitle("Settings")
			.confirmationDialog(
				"This action cannot be undone",
				isPresented: $viewModel.isConfirmingResetData,
				titleVisibility: .visible
			) {
				Button("Delete", role: .destructive) {
					viewModel.resetDefaults()
					haptic(.success)
				}
				Button("Cancel", role: .cancel) { }
			}
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
		.tint(.teal)
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
	
	@ViewBuilder
	private var resetAppButton: some View {
		Button("Reset to Original", role: .destructive) {
			viewModel.isConfirmingResetData.toggle()
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
