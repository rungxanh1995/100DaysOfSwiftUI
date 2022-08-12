//
//  SaturationAndBlurView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct SaturationAndBlurView: View {
	@State
	private var amount = 0.0
	
    var body: some View {
		VStack {
			Image("TorontoSkyline")
				.resizable()
				.scaledToFit()
				.frame(width: 300, height: 300)
				.saturation(amount)
				.blur(radius: (1 - amount) * 20)
			
			Slider(value: $amount)
				.padding()
		}
    }
}

struct SaturationAndBlurView_Previews: PreviewProvider {
    static var previews: some View {
		SaturationAndBlurView()
    }
}
