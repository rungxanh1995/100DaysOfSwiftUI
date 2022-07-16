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
		
		// You can use an HStack to group these text views.
		// However, I implement this way to better support accessability.
		// For info: https://www.hackingwithswift.com/quick-start/swiftui/how-to-combine-text-views-together
		(
			Text("Score")
			+ Text(": \(score)")
		)
		.font(.title.bold())
		.foregroundColor(.white)
    }
}
