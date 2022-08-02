//
//  MHKeypadActionHandler.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHKeypadActionHandler {
	
	@Binding
	var game: MHGame

	
	func didTapButton(perform action: MHKeypadType) -> Void {
		guard game.isGameActive else { return }
		
		game.animatingIncreaseScore = false
		game.animatingDecreaseScore = false
		
		switch(action) {
			
			case .k0, .k1, .k2, .k3, .k4, .k5, .k6, .k7, .k8, .k9:
				if game.playerAnswer.count < 3 {
					game.playerAnswer += String(action.rawValue)
				}
			
			case .backspace:
				if game.playerAnswer.count > 0 {
					game.playerAnswer.removeLast()
				}
			
			case .done:
				guard !game.playerAnswer.isEmpty else { return }
				
				updateGameScoreAndAnimateEmojis()
				
				game.playerAnswer = ""
				decideRoundIsOver()
				game.incrementCurrentQuestion()
			
			default:
				break
		}
	}
	
	fileprivate func updateGameScoreAndAnimateEmojis() {
		if game.questions[game.currentQuestion].resultString == game.playerAnswer {
			game.userScore += 1
			
			withAnimation(.easeInOut(duration: 1)) {
				game.animatingIncreaseScore = true
			}
		} else {
			withAnimation(.easeInOut(duration: 1)) {
				game.animatingDecreaseScore = true
			}
		}
	}
	
	fileprivate func decideRoundIsOver() {
		if game.checkIfGameOver() == true {
			game.isGameActive = false
		}
	}
}

