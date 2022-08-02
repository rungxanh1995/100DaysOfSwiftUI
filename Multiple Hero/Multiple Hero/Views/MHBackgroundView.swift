//
//  MHBackgroundView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import SwiftUI

struct MHBackgroundView: View {
	var body: some View {
		RadialGradient(
			gradient: Gradient(colors: [.orange, .pink]),
			center: .center,
			startRadius: 2,
			endRadius: 650
		)
	}
}

struct MHBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MHBackgroundView()
    }
}
