//
//  MissionListLabelView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionListLabelView: View {
	
	@ObservedObject
	var viewModel: MissionListLabelViewModel
	
	var body: some View {
		VStack {
			Text(viewModel.mission.displayName)
				.font(.system(.headline, design: .serif))
				.foregroundColor(.white)
			
			Text(viewModel.mission.formattedLaunchDate)
				.font(.system(.caption, design: .serif))
				.foregroundColor(.white.opacity(0.75))
		}
		.padding(.vertical)
		.frame(maxWidth: .infinity)
	}
}

struct MissionListLabelView_Previews: PreviewProvider {
	private static let missions: [Mission] = Missions.allMissions
	
    static var previews: some View {
        MissionListLabelView(
			viewModel: MissionListLabelViewModel(mission: missions[0])
		)
		.preferredColorScheme(.dark)
    }
}
