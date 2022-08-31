//
//  HomeCellImage.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeCellImage: View {
	private(set) var user: User
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			Image(systemName: "person.crop.circle.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 60, height: 60)
				.foregroundColor(user.isActive ? .green : nil)
			
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
