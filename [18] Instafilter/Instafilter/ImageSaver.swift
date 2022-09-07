//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Joe Pham on 2022-09-06.
//

import UIKit

class ImageSaver: NSObject {
	
	// MARK: - Completion Callbacks
	var successHandler: (() -> Void)?
	var errorHandler: ((Error) -> Void)?
	
	func writeToSavedPhotoAlbum(_ image: UIImage) -> Void {
		UIImageWriteToSavedPhotosAlbum(
			image,
			/* target: */ self,
			#selector(saveCompleted),
			/* context: */ nil
		)
	}
	
	@objc
	private func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) -> Void {
		if let error = error {
			errorHandler?(error)
		} else {
			successHandler?()
		}
	}
}
