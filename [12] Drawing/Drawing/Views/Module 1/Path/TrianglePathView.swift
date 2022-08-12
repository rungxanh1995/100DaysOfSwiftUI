//
//  TrianglePathView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-10.
//

import SwiftUI

struct TrianglePathView: View {
    var body: some View {
		Path { path in
			path.move(to: CGPoint(x: 200, y: 100))
			path.addLine(to: CGPoint(x: 100, y: 300))
			path.addLine(to: CGPoint(x: 300, y: 300))
			path.addLine(to: CGPoint(x: 200, y: 100))
			path.closeSubpath()
		}
		.stroke(
			.blue,
			style: StrokeStyle(lineWidth: 10, lineCap: .square, lineJoin: .round)
		)
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        TrianglePathView()
    }
}
