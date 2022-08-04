//
//  MHKeypadActionHandler.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

class MHKeypadActionHandler {
	
	private let game: MHGame
	
	init(currentGame: MHGame) {
		self.game = currentGame
	}

	
	func didTapButton(perform action: MHKeypadType) -> Void {
		guard game.isGameActive else { return }
		
		game.animatingIncreaseScore = false
		game.animatingDecreaseScore = false
		
		switch(action) {
			
			case .k0, .k1, .k2, .k3, .k4, .k5, .k6, .k7, .k8, .k9:
				if game.playerAnswer.count < 3 {
					withAnimation(.linear(duration: 0.25)) {
						game.playerAnswer += String(action.rawValue)
					}
				}
			
			case .backspace:
				if game.playerAnswer.count > 0 {
					withAnimation(.easeInOut(duration: 0.25)) {
						game.playerAnswer.removeLast()
					}
				}
			
			case .done:
				guard !game.playerAnswer.isEmpty else { return }
				
				updateGameScoreAndAnimateEmojis()
				
				withAnimation(.easeInOut(duration: 0.5)) {
					game.playerAnswer = ""
					game.decideRoundIsOver()
				}
				game.askNewQuestion()
			
			default:
				break
		}
	}
	
	fileprivate func updateGameScoreAndAnimateEmojis() {
		let answerResult = game.getCurrentQuestion().resultString == game.playerAnswer
		game.updateScore(basedOn: answerResult)
		
		if answerResult == true {
			withAnimation(.easeInOut(duration: 1)) {
				game.animatingIncreaseScore = true
			}
		} else {
			withAnimation(.easeInOut(duration: 1)) {
				game.animatingDecreaseScore = true
			}
		}
	}
}

