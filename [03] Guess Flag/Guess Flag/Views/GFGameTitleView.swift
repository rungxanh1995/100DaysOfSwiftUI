//
//  GFGameTitleView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFGameTitleView: View {
    var body: some View {
		Text("Guess The Flag")
			.font(.largeTitle.bold())
			.foregroundColor(.white)
			.shadow(radius: 5)
    }
}

struct GFGameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GFGameTitleView()
			.preferredColorScheme(.dark)
    }
}
