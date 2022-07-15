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
		let scoreString: LocalizedStringKey = "\(Text("Score")): \(score)"
		
		Text(scoreString)
			.font(.title.bold())
			.foregroundColor(.white)
    }
}
