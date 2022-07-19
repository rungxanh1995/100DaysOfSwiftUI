//
//  RPSBackgroundView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSBackgroundView: View {
	private(set) var mode: RPSGameMode
	
	private let winColorStop1 = Gradient.Stop(color: Color.blue, location: 0.25)
	private let winColorStop2 = Gradient.Stop(color: Color.mint, location: 0.85)
	private let loseColorStop1 = Gradient.Stop(color: Color.red, location: 0.25)
	private let loseColorStop2 = Gradient.Stop(color: Color.orange, location: 0.75)
	
	
    var body: some View {
		let modeGradientStops =
		(mode == .playToWin)
		?
		[winColorStop1, winColorStop2]
		:
		[loseColorStop1, loseColorStop2]
		
		ZStack {
			GeometryReader { geo in
				Image("VintageBackground")
					.scaledToFill()
					.frame(height: geo.size.height)
				RadialGradient(
					stops: modeGradientStops,
					center: .top,
					startRadius: 100,
					endRadius: 900
				)
				.opacity(0.4)
			}
			.ignoresSafeArea()
			
		}
    }
}

struct RPGBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
		RPSBackgroundView(mode: .playToLose)
    }
}
