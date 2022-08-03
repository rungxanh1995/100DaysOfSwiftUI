//
//  MHBackgroundView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import SwiftUI

struct MHBackgroundView: View {
	
	/// Helper struct to sidestep limitations to stateful animation amount of MHBackgroundView
	private struct MHBackgroundAnimationValue: Equatable {
		var start = UnitPoint(x: 0, y: -2)
		var end = UnitPoint(x: 4, y: 0)
	}
	
	private let colors: [Color] = [.black, .red, .orange, .yellow, .red, .orange, .red, .pink, .black]
	private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
	
	@State
	private var animationAmount = MHBackgroundAnimationValue()
	
	var body: some View {
		
		LinearGradient(
			gradient: Gradient(colors: colors),
			startPoint: animationAmount.start,
			endPoint: animationAmount.end
		)
			.animation(
				.easeInOut(duration: 6).repeatForever(),
				value: animationAmount
			)
			.onReceive(timer, perform: { _ in
				modifyAnimationPoints()
			})
			.opacity(0.6)
			.blur(radius: 75, opaque: true)
	}
}

extension MHBackgroundView {
	fileprivate func modifyAnimationPoints() {
		animationAmount.start = UnitPoint(x: 4, y: 0)
		animationAmount.end = UnitPoint(x: 0, y: 2)
		animationAmount.start = UnitPoint(x: -4, y: 20)
		animationAmount.start = UnitPoint(x: 4, y: 0)
	}
}

struct MHBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MHBackgroundView()
    }
}
