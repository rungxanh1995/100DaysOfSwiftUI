//
//  RPSGameModeView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSGameModeView: View {
	private(set) var mode: RPSGameMode
	
	
    var body: some View {
		let modeVerb: String = (mode == .playToWin) ? "WIN" : "LOSE"
		
		HStack {
			Text("Which move to")
			Text(modeVerb)
				.foregroundColor((mode == .playToWin) ? Color("Bright blue") : Color("Bright orange"))
			Text("it?")
		}
		
    }
}

struct RPSGameModeView_Previews: PreviewProvider {
    static var previews: some View {
		RPSGameModeView(mode: .playToWin)
    }
}
