//
//  ParagraphDividerView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct ParagraphDividerView: View {
	let maxWidth: CGFloat
	
    var body: some View {
		Rectangle()
			.frame(height: 1)
			.foregroundColor(.moonshotLightColor)
			.frame(maxWidth: self.maxWidth)
			.padding(.vertical)
    }
}

struct ParagraphDividerView_Previews: PreviewProvider {
    static var previews: some View {
        ParagraphDividerView(maxWidth: 300)
    }
}
