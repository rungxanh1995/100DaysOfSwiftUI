//
//  ImageAsBorderOrFillView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct ImageAsBorderOrFillView: View {
    var body: some View {
		VStack(spacing: 20) {
			Text("Hello World")
				.frame(width: 200, height: 100)
				.border(
					ImagePaint(
						image: Image("Swift"),
						scale: 0.75
					),
					width: 25
				)
			
			Text("Hello World")
				.frame(width: 200, height: 100)
				.border(
					ImagePaint(
						image: Image("Swift"),
						sourceRect: CGRect(x: 0, y: 0.25, width: 0.5, height: 0.25),
						scale: 2.0),
					width: 30
				)
			
			Capsule()
				.strokeBorder(
					ImagePaint(
						image: Image("Swift"),
						scale: 0.5
					),
					lineWidth: 25
				)
				.frame(width: 200, height: 150)
		}
    }
}

struct ImageAsBorderOrFillView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAsBorderOrFillView()
    }
}
