//
//  HomeCellLabel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeCellLabel: View {
	private(set) var user: CachedUser
	
	var body: some View {
		VStack {
			Text(user.name)
				.font(.headline)
				
		}
		.padding(.vertical, 8)
		.frame(maxWidth: .infinity)
		.foregroundColor(.accentColor)
		.background(Color.accentColor.opacity(0.2))
	}
}
