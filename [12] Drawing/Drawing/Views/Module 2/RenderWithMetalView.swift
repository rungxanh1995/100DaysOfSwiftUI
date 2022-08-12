//
//  RenderWithMetalView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct RenderWithMetalView: View {
	@State private var colorCycle = 0.0
	
	var body: some View {
		VStack {
			ColorCyclingCircle(amount: colorCycle)
				.frame(width: 300, height: 300)
			
			Slider(value: $colorCycle)
		}
		.padding()
	}
}

struct ColorCyclingCircle: View {
	var amount = 0.0
	var steps = 100
	
	var body: some View {
		ZStack {
			ForEach(0..<steps, id:\.self) { value in
				Circle()
					.inset(by: Double(value))
//					.strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
					.strokeBorder(
						LinearGradient(
							gradient: Gradient(colors: [
								color(for: value, brightness: 1),
								color(for: value, brightness: 0.5)
							]),
							startPoint: .top,
							endPoint: .bottom
						),
						lineWidth: 2
					)
			}
		}
		.drawingGroup(colorMode: .extendedLinear)
	}
	
	func color(for value: Int, brightness: Double) -> Color {
		var targetHue = Double(value) / Double(steps) + amount
		limitInRangeFromZeroToOne(&targetHue)
		return Color(hue: targetHue, saturation: 1, brightness: brightness)
	}
	
	fileprivate func limitInRangeFromZeroToOne(_ hue: inout Double) {
		if hue > 1 { hue -= 1 }
	}
}

struct RenderWithMetalView_Previews: PreviewProvider {
    static var previews: some View {
        RenderWithMetalView()
    }
}
