//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Joe Pham on 2022-09-06.
//

import PhotosUI
import SwiftUI

struct ImagePicker {
	@Binding
	var image: UIImage?
	
}

extension ImagePicker: UIViewControllerRepresentable {
	
	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration()
		config.filter = .images
		
		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator as PHPickerViewControllerDelegate
		return picker
	}
	
	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {	}
}

extension ImagePicker {
	
	func makeCoordinator() -> Coordinator { ImagePicker.Coordinator(of: self) }
	
	/// Handles communication of underlying `PHPickerViewController`
	/// and its parent view `ImagePicker`.
	internal class Coordinator: NSObject, PHPickerViewControllerDelegate {
		var parent: ImagePicker
		
		/*
		 Tell coordinator what its parent is,
		 so it can modify values directly.
		 */
		init(of parent: ImagePicker) {
			self.parent = parent
		}
		
		func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
			picker.dismiss(animated: true)
			
			// Pluck out selected image and assigns to its parent's image property
			guard let provider = results.first?.itemProvider else { return }
			extractAndUpdateWithImage(from: provider)
		}
		
		fileprivate func extractAndUpdateWithImage(from itemProvider: NSItemProvider) {
			if itemProvider.canLoadObject(ofClass: UIImage.self) {
				itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
					self?.parent.image = image as? UIImage
				}
			}
		}
	}
}
