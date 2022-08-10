//
//  MissionView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionView: View {
	
	@ObservedObject
	var viewModel: MissionViewModel
	
	var body: some View {
		GeometryReader { geometry in
			ScrollView {
				VStack {
					MissionImageView(mission: viewModel.mission)
						.frame(maxWidth: geometry.size.width * 0.6)
					
					ParagraphDividerView(
						maxWidth: geometry.size.width * 0.9
					)
					
					MissionHighlightsView(mission: viewModel.mission)
						.padding(.horizontal)
					
					ParagraphDividerView(
						maxWidth: geometry.size.width * 0.9
					)
					
					MissionCrewListView(
						viewModel: MissionCrewListViewModel(
							parentVM: viewModel
						)
					)
					.padding(.trailing)
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(viewModel.mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.moonshotDarkColor)
	}
}

struct MissionView_Previews: PreviewProvider {
	
	static private let missions: [Mission] = Missions.allMissions
	static private let astronauts: [String: Astronaut] = Astronauts.allAstronauts
	
    static var previews: some View {
		MissionView(viewModel: MissionViewModel(
			mission: missions[0],
			astronauts: astronauts)
		)
		.preferredColorScheme(.dark)
    }
}
