//
//  HomeCellImage.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeCellImage: View {
	private(set) var user: User
	var size: CGFloat = 60.0
	
	@Environment(\.colorScheme)
	private var colorScheme
	
	private var gradientTopColor: Color {
		switch colorScheme {
			case .light:
				return .white.opacity(0.5)
			case .dark:
				return .secondary.opacity(0.5)
			@unknown default:
				return .clear
		}
	}
	
	private var gradientBottomColor: Color {
		switch colorScheme {
			case .light:
				return .secondary.opacity(0.75)
			case .dark:
				return .black.opacity(0.5)
			@unknown default:
				return .clear
		}
	}
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			Symbols.Images.person
				.resizable()
				.scaledToFit()
				.foregroundColor(.secondary)
				.frame(width: size, height: size)
				.accessibilityLabel("Person image")
			
			// Transparent mask
			LinearGradient(
				colors: [gradientTopColor, gradientBottomColor],
				startPoint: .top,
				endPoint: .bottom
			)
			.frame(width: size, height: size)
			.clipShape(Circle())
			
			OnlineIndicator(
				isOnline: user.isActive
			)
		}
	}
}

private extension HomeCellImage {

	
	
}


struct HomeCellImage_Previews: PreviewProvider {
    static var previews: some View {
		HomeCellImage(user: User.sampleUser)
    }
}
