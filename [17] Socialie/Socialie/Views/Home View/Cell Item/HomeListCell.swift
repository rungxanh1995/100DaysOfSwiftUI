//
//  HomeListCell.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI


struct HomeListCell: View {
	private(set) var user: User
	
	var body: some View {
		HStack(spacing: 12) {
			HomeCellImage(user: user)
			VStack(alignment: .leading) {
				Text(user.name)
					.font(.headline)
				Text(user.isActive ? "Online" : "Offline")
					.font(.callout)
					.foregroundColor(.secondary)
			}
		}
	}
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
		HomeListCell(user: User.sampleUser)
    }
}
