//
//  MissionCrewListView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionCrewListView: View {
	
	@EnvironmentObject
	var viewModel: MissionCrewListViewModel
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("Crew List")
				.font(.system(.title, design: .serif).bold())
				.padding(.bottom, 5)
				.padding(.horizontal)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(viewModel.crew, id: \.role) { crewMember in
						
						let eachAstronautViewModel = AstronautViewModel(
							astronaut: crewMember.astronaut
						)
						
						NavigationLink {
							AstronautView(
								viewModel: eachAstronautViewModel
							)
						} label: {
							crewMemberView(of: crewMember)
						}
					}
				}
			}
		}
    }
}

private extension MissionCrewListView {
	
	@ViewBuilder
	private func crewMemberView(of member: CrewMember) -> some View {
		HStack {
			Image(member.astronaut.id)
				.resizable()
				.frame(width: 104, height: 72)
				.clipShape(Circle())
				.overlay(
					Circle()
						.stroke(.moonshotLightColor)
				)
			
			VStack(alignment: .leading) {
				Text(member.astronaut.name)
					.font(.system(.headline, design: .serif))
					.foregroundColor(.white)
				Text(member.role)
					.font(.system(.callout, design: .serif))
					.foregroundColor(.secondary)
			}
		}
	}
}

struct MissionCrewListView_Previews: PreviewProvider {
	static private let missionViewModel = MissionView.ViewModel(
		mission: Missions.allMissions[0],
		astronauts: Astronauts.allAstronauts
	)
	static private let missionCrewListVM = MissionCrewListViewModel(crew: missionViewModel.crew)
	
    static var previews: some View {
		MissionCrewListView()
			.environmentObject(missionCrewListVM)
			.preferredColorScheme(.dark)
    }
}
