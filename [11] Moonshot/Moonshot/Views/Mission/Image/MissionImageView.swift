//
//  MissionImageView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

/// Custom image of a mission in Mission view
struct MissionImageView: View {
	
	/// Can refactor this to a view model, if logic grows in the future
	let mission: Mission
		
	var body: some View {
		Image(mission.imageName)
			.resizable()
			.scaledToFit()
			.padding(.top)
    }
}

struct MissionImageView_Previews: PreviewProvider {
	private static let missions: [Mission] = Missions.allMissions

    static var previews: some View {
        MissionImageView(mission: missions[0])
    }
}
