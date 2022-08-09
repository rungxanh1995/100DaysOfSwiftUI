//
//  MissionListImageView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

/// Custom image of a mission in Home view's list/grid
struct MissionListImageView: View {
	
	/// Can refactor this to a view model, if logic grows in the future
	let mission: Mission
	
    var body: some View {
		Image(mission.imageName)
			.resizable()
			.scaledToFit()
			.frame(width: 100, height: 100)
			.padding()
    }
}

struct MissionListImageView_Previews: PreviewProvider {
	private static let missions: [Mission] = Missions.allMissions
	
    static var previews: some View {
        MissionListImageView(mission: missions[0])
    }
}
