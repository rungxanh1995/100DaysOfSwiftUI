//
//  RPSSettingsView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-08-23.
//

import SwiftUI

struct RPSSettingsView: View {
	
	@AppStorage(UserDefaultKeys.hapticsEnabled)
	private var isHapticsEnabled: Bool = true
	
	@Environment(\.dismiss) var dismissView
	
	var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("Haptics")
				) {
					haptics
				}
				
			}
			.navigationTitle("Settings")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) { navBarCloseButton }
			}
		}
	}
}

private extension RPSSettingsView {
	var haptics: some View {
		Toggle("Enable Vibrations", isOn: $isHapticsEnabled)
			.font(.system(.body, design: .serif))
	}
	
	var navBarCloseButton: some View {
		Button {
			dismissView()
		} label: {
			Label("Close", systemImage: "xmark.circle.fill")
				.symbolRenderingMode(.hierarchical)
		}
	}
}

struct RPSSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RPSSettingsView()
    }
}
