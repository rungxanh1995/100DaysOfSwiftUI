//
//  InsettableArcShapeView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct InsettableArcShapeView: View {
    var body: some View {
		InsettableArc(
			startAngle: .degrees(-90),
			endAngle: .degrees(90),
			isClockwise: true
		)
		.strokeBorder(.teal, lineWidth: 25)
		
		.frame(width: 300, height: 300)
    }
}

struct InsettableArc: InsettableShape {
	
	private(set) var startAngle: Angle
	private(set) var endAngle: Angle
	private(set) var isClockwise: Bool
	private(set) var insetAmount: Double = 0.0
	
	func path(in rect: CGRect) -> Path {
		
		let (
			moddedStartAngle,
			moddedEndAngle,
			moddedClockwise
		) = adjustPropertiesToBeNatural()
		
		var path = Path()
		path.addArc(
			center: CGPoint(x: rect.midX, y: rect.midY),
			radius: rect.width / 2 - insetAmount,
			startAngle: moddedStartAngle,
			endAngle: moddedEndAngle,
			clockwise: moddedClockwise
		)
		return path
	}
	
	/// Workaround SwiftUI's way of drawing an arc
	private func adjustPropertiesToBeNatural() -> (Angle, Angle, Bool) {
		let rotationAdjustment = Angle(degrees: 270)
		let adjustedStart = startAngle + rotationAdjustment
		let adjustedEnd = endAngle + rotationAdjustment
		let adjustedClockWise = !isClockwise
		return (adjustedStart, adjustedEnd, adjustedClockWise)
	}
	
	func inset(by amount: CGFloat) -> InsettableArc {
		var arc = self
		arc.insetAmount += amount
		return arc
	}
}

struct InsettableArcShapeView_Previews: PreviewProvider {
    static var previews: some View {
        InsettableArcShapeView()
    }
}
