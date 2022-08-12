//
//  ArcShapeView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct ArcShapeView: View {
    var body: some View {
		Arc(
			startAngle: .degrees(0),
			endAngle: .degrees(90),
			isClockwise: true
		)
		.stroke(.blue, lineWidth: 10)
		.frame(width: 300, height: 300)
    }
}

struct Arc: Shape {
	private(set) var startAngle: Angle
	private(set) var endAngle: Angle
	private(set) var isClockwise: Bool
	
	func path(in rect: CGRect) -> Path {
		
		let (
			moddedStartAngle,
			moddedEndAngle,
			moddedClockwise
		) = adjustPropertiesToBeNatural()
		
		var path = Path()
		path.addArc(
			center: CGPoint(x: rect.midX, y: rect.midY),
			radius: rect.width / 2,
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
}

struct ArcShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ArcShapeView()
    }
}
