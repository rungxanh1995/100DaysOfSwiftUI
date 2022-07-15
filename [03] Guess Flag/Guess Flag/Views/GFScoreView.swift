//
//  GFScoreView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import SwiftUI

struct GFScoreView: View {
	var score: Int
	
    var body: some View {
		Text("\("Score".localized()): \(score)")
			.font(.title.bold())
			.foregroundColor(.white)
    }
}
