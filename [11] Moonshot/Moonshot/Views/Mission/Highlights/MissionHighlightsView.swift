//
//  MissionHighlightsView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionHighlightsView: View {
	
	let mission: Mission
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("Mission Highlights")
				.font(.system(.title, design: .serif).bold())
				.padding(.bottom, 5)
			
			Text(mission.description)
				.font(.system(.body, design: .serif))
		}
    }
}

struct MissionHighlightsView_Previews: PreviewProvider {
	private static let missions: [Mission] = Missions.allMissions
	
    static var previews: some View {
        MissionHighlightsView(mission: missions[0])
    }
}
