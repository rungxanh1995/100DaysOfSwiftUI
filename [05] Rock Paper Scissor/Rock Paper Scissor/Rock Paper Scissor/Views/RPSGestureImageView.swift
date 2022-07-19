	//
	//  RPSGestureImageView.swift
	//  Rock Paper Scissor
	//
	//  Created by Joe Pham on 2022-07-18.
	//

import SwiftUI

struct RPSGestureImageView: View {
	private(set) var gesture: RPSGestureType
	
	var body: some View {
		let gestureImageName = Self.getImageName(from: gesture)
		return Image(gestureImageName)
			.resizable()
			.frame(maxWidth: 75, maxHeight: 75)
			.shadow(radius: 5, x: 0, y: 5)
			.padding()
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
