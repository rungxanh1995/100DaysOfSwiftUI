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
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			Symbols.Images.person
				.resizable()
				.scaledToFit()
				.frame(width: size, height: size)
				.foregroundColor(user.isActive ? .green : .secondary)
				.accessibilityLabel("Person image")
			
			OnlineIndicator(
				isOnline: user.isActive
			)
		}
	}
}


struct HomeCellImage_Previews: PreviewProvider {
    static var previews: some View {
		HomeCellImage(user: User.sampleUser)
    }
}
