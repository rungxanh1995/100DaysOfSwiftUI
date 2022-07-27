//
//  ToggleTransitionsView.swift
//  Animations
//
//  Created by Joe Pham on 2022-07-27.
//

import SwiftUI

struct ToggleTransitionsView: View {
	@State
	private var isShowingRectangle = false
	
    var body: some View {
		VStack {
			Button("Tap Me") {
				withAnimation {
					isShowingRectangle.toggle()
				}
			}
			.tint(.orange)
			.buttonStyle(.bordered)
			
			if isShowingRectangle {
				Rectangle()
					.fill(.orange)
					.frame(width: 200, height: 150)
					.transition(
						.asymmetric(insertion: .scale, removal: .opacity)
					)
			}
		}
    }
}

struct ToggleTransitionsView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTransitionsView()
    }
}
