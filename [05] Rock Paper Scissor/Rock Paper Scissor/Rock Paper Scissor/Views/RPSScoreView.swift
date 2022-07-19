//
//  RPSScoreView.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSScoreView: View {
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
		.foregroundColor(.black)
	}
}

struct RPSScoreView_Previews: PreviewProvider {
	static var previews: some View {
		RPSScoreView(score: 0)
	}
}

