//
//  TransformingShapeView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct TransformingShapeView: View {
	@State
	private var petalOffset: Double = -20.0
	
	@State
	private var petalWidth: Double = 80.0
	
	var body: some View {
		VStack {
			Flower(
				petalOffsetFromCenter: petalOffset,
				petalWidth: petalWidth
			)
			.fill(.yellow, style: FillStyle(eoFill: true))
			
			Text("Offset")
			Slider(value: $petalOffset, in: -40...40)
				.padding(.bottom)
			
			Text("Width")
			Slider(value: $petalWidth, in: 0...100)
		}
		.tint(.teal)
		.padding()
	}
}

struct Flower: Shape {
	var petalOffsetFromCenter: Double = -20.0
	var petalWidth: Double = 80.0
	
	func path(in rect: CGRect) -> Path {
		var pathToHoldPetals = Path()
		
		// Count from 0 up to pi * 2, moving up pi / 8 each time
		for eachRadianStep in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
			let petalRotation = CGAffineTransform(rotationAngle: eachRadianStep)
			
			let viewCenterPoint = CGAffineTransform(
				translationX: rect.width / 2,
				y: rect.height / 2
			)
			let petalPosition = petalRotation.concatenating(viewCenterPoint)
			
			let originalPetal = Path(
				ellipseIn: CGRect(
					x: petalOffsetFromCenter,
					y: 0,
					width: petalWidth,
					height: rect.width / 2
				)
			)
			
			let rotatedPetal = originalPetal.applying(petalPosition)
			pathToHoldPetals.addPath(rotatedPetal)
		}
		
		// now send the main path back
		return pathToHoldPetals
	}
}

struct TransformingShapeView_Previews: PreviewProvider {
    static var previews: some View {
        TransformingShapeView()
    }
}
