//
//  ContentView.swift
//  Instafilter
//
//  Created by Joe Pham on 2022-09-05.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
	/// The image to be displayed on screen
	@State
	internal var image: Image?
	
	/// The underlying image picked by user
	@State
	internal var inputImage: UIImage?
	
	@State
	private var processedImage: UIImage?
	
	@State
	private var currentFilter: CIFilter = .sepiaTone()
	let context: CIContext = .init()
	
	@State
	internal var filterIntensity: Float = 0.5
	
	@State
	internal var filterRadius: Float = 10.0
	
	@State
	internal var showingImagePicker: Bool = false
	
	@State
	private var showingFilterSheet: Bool = false
	
    var body: some View {
		NavigationView {
			VStack {
				photoFrame
				
				intensitySlider
				radiusSlider

				HStack {
					Button("Change Filter") {
						showingFilterSheet.toggle()
					}
					
					Spacer()
					
					Button("Save", action: save)
						.disabled(processedImage == nil)
				}
				.buttonStyle(.bordered)
			}
			.sheet(isPresented: $showingImagePicker) {
				ImagePicker(image: $inputImage)
			}
			.confirmationDialog(
				"Select a filter",
				isPresented: $showingFilterSheet,
				titleVisibility: .visible
			) {
				Button("Crystallize") { setFilter(.crystallize()) }
				Button("Edges") { setFilter(.edges()) }
				Button("Gaussian Blur") { setFilter(.gaussianBlur()) }
				Button("Pixellate") { setFilter(.pixellate()) }
				Button("Sepia Tone") { setFilter(.sepiaTone()) }
				Button("Unsharp Mask") { setFilter(.unsharpMask()) }
				Button("Vignette") { setFilter(.vignette()) }
				Button("Cancel", role: .cancel) { }
			}
			.onChange(of: inputImage) { _ in
				loadImage()
			}
			.padding([.horizontal, .bottom])
			.navigationTitle("Instafilter")
		}
    }
	
	func loadImage() -> Void {
		guard let inputImage = inputImage else { return }
		
		let beginImage = CIImage(image: inputImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	}
	
	func applyProcessing() -> Void {
		let inputKeys = currentFilter.inputKeys
		
		if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
		if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 100, forKey: kCIInputRadiusKey) }
		if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
		
		guard let outputImage = currentFilter.outputImage else { return }
		if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
			let uiImage = UIImage(cgImage: cgImg)
			image = Image(uiImage: uiImage)
			processedImage = uiImage
		}
	}
	
	func setFilter(_ filter: CIFilter) {
		currentFilter = filter
		loadImage()
	}
	
	func save() -> Void {
		guard let processedImage = processedImage else { return }
		
		let imageSaver = ImageSaver()
		imageSaver.successHandler = {
			print("Saved image successfully!")
		}
		imageSaver.errorHandler = {
			print("Error saving image: \($0.localizedDescription)")
		}
		
		imageSaver.writeToSavedPhotoAlbum(processedImage)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


