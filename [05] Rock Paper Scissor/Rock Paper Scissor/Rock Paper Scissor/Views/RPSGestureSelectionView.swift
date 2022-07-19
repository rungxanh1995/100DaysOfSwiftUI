	//
	//  RPSGestureSelectionView.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-18.
	//

import SwiftUI


struct RPSGestureSelectionView: View {
	@Binding var game: RPSGame
	
	var body: some View {
		
		HStack {
			ForEach(RPSGestureType.allCases, id: \.self) { gesture in
				
				RPSGestureImageView(gesture: gesture)
					.onTapGesture {
						// TODO: Code next steps here
						// including update score,
						// and next question
						print(gesture.rawValue)
						print(game.isCorrectAnswer(playerMove: gesture))
					}
			}
		}
	}
}

struct RPSGestureSelectionView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(RPSGame()) {
			RPSGestureSelectionView(game: $0)
		}
	}
}
