//
//  RPSRibbonHeaderView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSRibbonHeaderView: View {
	var body: some View {
		Image("VintageHeaderRibbon")
			.withLightShadow()
	}
}

struct RPSRibbonHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		RPSRibbonHeaderView()
	}
}
