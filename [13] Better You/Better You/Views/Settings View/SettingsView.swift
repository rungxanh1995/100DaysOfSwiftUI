//
//  SettingsView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-23.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage(UserDefaultsKey.hapticsEnabled)
	private var isHapticsEnabled: Bool = true
	
	@AppStorage(UserDefaultsKey.systemTheme)
	private var systemTheme: Int = SchemeType.allCases.first!.rawValue
	
	@State
	private var isConfirmingResetData: Bool = false
	
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
				isPresented: $isConfirmingResetData,
				titleVisibility: .visible
			) {
				Button("Delete", role: .destructive) {
					resetDefaults()
				}
				Button("Cancel", role: .cancel) { }
			}
		}
	}
}

private extension SettingsView {
	@ViewBuilder
	private var haptics: some View {
		Toggle("Enable Haptics", isOn: $isHapticsEnabled)
			.tint(.teal)
	}
	
	@ViewBuilder
	private var appTheme: some View {
		Picker("Color Theme", selection: $systemTheme) {
			ForEach(SchemeType.allCases) { (theme) in
				Text(theme.title)
					.tag(theme.rawValue)
			}
		}
	}
	
	@ViewBuilder
	private var resetAppButton: some View {
		Button("Reset to Original", role: .destructive) {
			isConfirmingResetData.toggle()
		}
	}
	
	/// Reset app data
	private func resetDefaults() {
		let defaults = UserDefaults.standard
		let dictionary = defaults.dictionaryRepresentation()
		dictionary.keys.forEach { key in
			defaults.removeObject(forKey: key)
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
