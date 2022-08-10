//
//  MissionLaunchDateBadge.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionLaunchDateBadge: View {
	
	let date: String
	
	var body: some View {
		HStack {
			calendarIcon
			Text(date)
				.font(.system(.callout, design: .serif))
				.foregroundColor(.white)
		}
		.padding(6)
		.background(.moonshotLightColor)
		.cornerRadius(8)
	}
	
	@ViewBuilder
	private var calendarIcon: some View {
		Image(systemName: "calendar.badge.clock")
			.symbolRenderingMode(.hierarchical)
	}
}

struct MissionLaunchDateBadge_Previews: PreviewProvider {
    static var previews: some View {
        MissionLaunchDateBadge(date: "Jan 9, 2007")  // original iPhone release date 😉
    }
}
