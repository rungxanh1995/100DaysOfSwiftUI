//
//  RPSSettingsView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-08-23.
//

import SwiftUI

struct RPSSettingsView: View {
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
		Toggle("Enable Vibrations", isOn: .constant(true))
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
