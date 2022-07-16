//
//  GFFlagImageView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-16.
//

import SwiftUI

// Challenge 2

/// A custom view for flags, with original rendering mode
/// so that it overrides the parent view's corresponding modifiers,
/// and keeps the original colors of the flag.
/// - Parameters:
/// 	- flagImageName: String name of flag image in Asset catalog
struct GFFlagImageView: View {
	private(set) var flagImageName: String
	
    var body: some View {
		Image(flagImageName)
			.renderingMode(.original)
    }
}

struct GFFlagImageView_Previews: PreviewProvider {
    static var previews: some View {
		GFFlagImageView(flagImageName: "Spain")
    }
}
