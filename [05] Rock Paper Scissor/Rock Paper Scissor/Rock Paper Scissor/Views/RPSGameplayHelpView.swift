//
//  RPSGameplayHelpView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-08-08.
//

import SwiftUI

struct RPSGameplayHelpView: View {
	@Environment(\.dismiss) var dismissView
	
	var body: some View {
		NavigationView {
			ScrollView {
				
				Text("""
RPS (Rock-Paper-Scissors) is not your conventional RPS game. This game asks you to either play to win, or play to lose each round.\n\nA randomly selected move by the app is presented at the top, your task is to select one of the 3 hand gestures underneath to win/lose the offered gesture.
""")
				.font(.system(.body, design: .serif))
			}
			.padding(.horizontal)
			.navigationTitle("About This Game")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) { navBarCloseButton }
			}
		}
	}
}

private extension RPSGameplayHelpView {
	var navBarCloseButton: some View {
		Button {
			dismissView()
		} label: {
			Label("Close", systemImage: "xmark.circle.fill")
				.symbolRenderingMode(.hierarchical)
		}
	}
}

struct RPSGameplayHelpView_Previews: PreviewProvider {
	static var previews: some View {
		RPSGameplayHelpView()
	}
}
