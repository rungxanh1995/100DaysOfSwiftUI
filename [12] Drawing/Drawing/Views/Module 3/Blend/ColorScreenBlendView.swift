//
//  ColorScreenBlendView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct ColorScreenBlendView: View {
	@State
	private var zoomAmount = 0.0
	
	var body: some View {
		VStack {
			ZStack {
				Circle()
					.fill(Color(red: 1, green: 0, blue: 0))
					.frame(width: 200 * zoomAmount)
					.offset(x: -50, y: -80)
					.blendMode(.screen)
				
				Circle()
					.fill(Color(red: 0, green: 1, blue: 0))
					.frame(width: 200 * zoomAmount)
					.offset(x: 50, y: -80)
					.blendMode(.screen)
				
				Circle()
					.fill(Color(red: 0, green: 0, blue: 1))
					.frame(width: 200 * zoomAmount)
					.blendMode(.screen)
			}
			.frame(width: 300, height: 300)
			
			Slider(value: $zoomAmount)
				.padding()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.black)
		.ignoresSafeArea()
	}
}

struct ColorScreenBlendView_Previews: PreviewProvider {
    static var previews: some View {
        ColorScreenBlendView()
    }
}
