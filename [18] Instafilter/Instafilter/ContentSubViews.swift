//
//  ContentSubViews.swift
//  Instafilter
//
//  Created by Joe Pham on 2022-09-08.
//

import SwiftUI

extension ContentView {
	@ViewBuilder
	var photoFrame: some View {
		ZStack {
			Rectangle()
				.fill(Color.accentColor.opacity(0.2))
			
			if self.inputImage == nil {
				Text("Tap to select a picture")
					.font(.headline)
					.foregroundColor(.primary.opacity(0.5))
			}
			
			self.image?
				.resizable()
				.scaledToFit()
				.shadow(radius: 5)
		}
		.onTapGesture {
			self.showingImagePicker.toggle()
		}
	}
	
	@ViewBuilder
	var intensitySlider: some View {
		HStack {
			Text("Intensity")
			Slider(value: $filterIntensity)
				.onChange(of: filterIntensity) { _ in
					applyProcessing()
				}
		}
	}
}
