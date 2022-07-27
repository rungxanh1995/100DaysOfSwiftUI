//
//  CustomTransitionView.swift
//  Animations
//
//  Created by Joe Pham on 2022-07-27.
//

import SwiftUI

struct CustomTransitionView: View {
	@State private var isPivotingRed = false
	
	var body: some View {
		ZStack {
			Rectangle()
				.fill(.blue)
				.frame(width: 200, height: 200)
			
			if isPivotingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					.transition(.pivot)
			}
		}
		.onTapGesture {
			withAnimation {
				isPivotingRed.toggle()
			}
		}
	}
}

struct CornerRotateModifier: ViewModifier {
	let amount: Double
	let anchor: UnitPoint
	
	func body(content: Content) -> some View {
		content
			.rotationEffect(
				.degrees(amount),
				anchor: anchor
			)
			.clipped()
	}
}

extension AnyTransition {
	static var pivot: AnyTransition {
		return .modifier(
			active: CornerRotateModifier(amount: -90, anchor: .topLeading),
			identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
		)
	}
}

struct CustomTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionView()
    }
}
