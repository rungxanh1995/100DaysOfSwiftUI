//
//  HomeGridCell.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeGridCell: View {
	var user: CachedUser
	
	var body: some View {
		VStack(spacing: 0) {
			HomeCellImage(user: user)
				.padding()
			HomeCellLabel(user: user)
		}
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(Color.accentColor.opacity(0.25)))
	}
}

//struct HomeCell_Previews: PreviewProvider {
//    static var previews: some View {
//		HomeGridCell(user: User.sampleUser)
//    }
//}
