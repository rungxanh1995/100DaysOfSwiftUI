	//
	//  RPSGestureImageView.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-18.
	//

import SwiftUI

struct RPSGestureImageView: View {
	@Binding var game: RPSGame
	private(set) var gesture: RPSGestureType
	@State private var isPressed = false
	
	var body: some View {
		let gestureImageName = Self.getImageName(from: gesture)
		return Image(gestureImageName)
			.resizable()
			.frame(maxWidth: 75, maxHeight: 75)
			.withLightShadow()
			.padding()
			.onLongPressGesture(minimumDuration: 0.05) {
				game.playerSelectedAnswer(gesture)
			} onPressingChanged: { alreadyPressed in
				self.isPressed = alreadyPressed
			}
			.opacity(isPressed ? 0.25 : 1.0)
	}
	
	private static func getImageName(from gesture: RPSGestureType) -> String {
		switch gesture {
			case .rock:
				return RPSGestureType.rock.rawValue
			case .paper:
				return RPSGestureType.paper.rawValue
			case .scissor:
				return RPSGestureType.scissor.rawValue
		}
	}
}
