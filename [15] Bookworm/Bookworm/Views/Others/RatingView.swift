//
//  RatingView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import SwiftUI

struct RatingView: View {
	@Binding
	var rating: Int
	
	var label: String = ""
		
	private let maximumRating: Int = 5
	
	var offImage: Image?
	var onImage: Image = Symbols.starFilled
	
	private let offColor = Color.secondary
	private let onColor = Color.red
	
    var body: some View {
		HStack(spacing: 0) {
			if label.isEmpty == false {
				Text(label)
					.foregroundColor(.secondary)
				Spacer()
			}
			
			ForEach(1..<maximumRating + 1, id: \.self) { number in
				image(for: number)
					.foregroundColor(number > rating ? offColor : onColor)
					.onTapGesture {
						rating = number
					}
			}
		}
    }
	
	private func image(for number: Int) -> Image {
		if number > rating {
			return offImage ?? onImage
		} else {
			return onImage
		}
	}
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: .constant(4))
    }
}
