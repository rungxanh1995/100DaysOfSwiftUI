//
//  HomeCellLabel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeCellLabel: View {
	private(set) var user: User
	
	var body: some View {
		VStack {
			Text(user.name)
				.font(.headline)
				
		}
		.padding(.vertical, 8)
		.frame(maxWidth: .infinity)
		.foregroundColor(.white)
		.background(Color.accentColor.opacity(0.5))
	}
}

struct HomeCellLabel_Previews: PreviewProvider {
    static var previews: some View {
		HomeCellLabel(user: User.sampleUser)
    }
}
