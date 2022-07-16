//
//  GFBackgroundView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFBackgroundView: View {
	private var color1 = Gradient.Stop(color: Color("Dark indigo"), location: 0.3)
	private var color2 = Gradient.Stop(color: Color("Toned maroon"), location: 0.3)
	
    var body: some View {
		RadialGradient(
			stops: [color1, color2],
			center: .top,
			startRadius: 200,
			endRadius: 700
		)
    }
}

struct GFBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GFBackgroundView()
    }
}
