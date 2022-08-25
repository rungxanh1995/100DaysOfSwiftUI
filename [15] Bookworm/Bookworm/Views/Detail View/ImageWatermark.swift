//
//  ImageWatermark.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import SwiftUI

struct ImageWatermark: View {
	let text: Text
	
	var body: some View {
		text
			.font(.caption)
			.fontWeight(.black)
			.padding(10)
			.foregroundColor(.white)
			.background(.black.opacity(0.75))
			.cornerRadius(10)
			.offset(x: -5, y: -5)
	}
}

struct ImageWatermark_Previews: PreviewProvider {
    static var previews: some View {
        ImageWatermark(text: Text("Watermark"))
    }
}
