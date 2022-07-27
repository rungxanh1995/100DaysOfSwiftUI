	//
	//  GestureAnimationsView.swift
	//  Animations
	//
	//  Created by Joe Pham on 2022-07-27.
	//

import SwiftUI

struct GestureAnimationsView: View {
	@State
	private var dragAmount = CGSize.zero
	
	
	@State
	private var isDragEnabled = false
	
	var body: some View {
		cardView
		lettersView
	}
}

extension GestureAnimationsView {
	@ViewBuilder
	private var cardView: some View {
		LinearGradient(
			gradient: Gradient(colors: [.yellow, .red]),
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
		.frame(width: 300, height: 200)
		.clipShape(RoundedRectangle(cornerRadius: 12))
		.shadow(radius: 10, x: 0, y: 0)
		.offset(dragAmount)
		.gesture(
			DragGesture()
				.onChanged {
					dragAmount = $0.translation
				}
				.onEnded { _ in
					withAnimation(.interpolatingSpring(stiffness: 50, damping: 10)) {
						dragAmount = .zero
					}
				}
		)
	}
	
	@ViewBuilder
	private var lettersView: some View {
		let sampleStringArray = Array("Hello, SwiftUI")
		
		HStack(spacing: 0) {
			ForEach(0..<sampleStringArray.count, id: \.self) { charPosition in
				Text(String(sampleStringArray.element(charPosition)))
					.padding(5)
					.font(.title)
					.background(isDragEnabled ? .mint : .yellow)
					.offset(dragAmount)
					.gesture(
						DragGesture()
							.onChanged {
								dragAmount = $0.translation
							}
							.onEnded { _ in
								dragAmount = .zero
								isDragEnabled.toggle()
							}
					)
					.animation(.default.delay(Double(charPosition) / 25), value: dragAmount)
			}
		}
	}
}

struct GestureAnimationsView_Previews: PreviewProvider {
	static var previews: some View {
		GestureAnimationsView()
	}
}
