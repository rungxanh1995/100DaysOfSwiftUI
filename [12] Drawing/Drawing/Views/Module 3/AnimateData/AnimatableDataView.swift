//
//  AnimatableDataView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct AnimatableDataView: View {
	@State
	private var insetAmount: Double = 50.0
		
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
			.fill(.teal)
			.frame(width: 300, height: 250)
			.onTapGesture {
				withAnimation(
					.interpolatingSpring(stiffness: 50, damping: 5)
				) {
					insetAmount = Double.random(in: 10...90)
				}
			}
    }
}

struct Trapezoid: Shape {
	var insetAmount: Double
	
	var animatableData: Double {
		get { insetAmount }
		set { insetAmount = newValue }
	}
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: 0, y: rect.maxY))
		path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: 0, y: rect.maxY))
		path.closeSubpath()
		return path
	}
}

struct AnimatableDataView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataView()
    }
}
