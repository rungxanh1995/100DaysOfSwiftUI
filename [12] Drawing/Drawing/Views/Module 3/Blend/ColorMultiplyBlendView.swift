//
//  ColorMultiplyBlendView.swift
//  Drawing
//
//  Created by Joe Pham on 2022-08-11.
//

import SwiftUI

struct ColorMultiplyBlendView: View {
    var body: some View {
		ZStack {
			Image("Kindle")
			
			Rectangle()
				.fill(.teal)
				.blendMode(.multiply)
		}
		.frame(width: 400, height: 400)
		.clipped()
		
		Image("Kindle")
			.colorMultiply(.red)
			.frame(width: 400, height: 400)
    }
}

struct ColorMultiplyBlendView_Previews: PreviewProvider {
    static var previews: some View {
        ColorMultiplyBlendView()
    }
}
