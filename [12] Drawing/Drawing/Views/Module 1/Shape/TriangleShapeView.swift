//
//  TriangleShapeView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct TriangleShapeView: View {
    var body: some View {
        Triangle()
			.stroke(
				.orange,
				style: StrokeStyle(
					lineWidth: 10, lineCap: .round, lineJoin: .round
				)
			)
			.frame(width: 300, height: 300)
    }
}

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		path.closeSubpath()
		return path
	}
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleShapeView()
    }
}
