//
//  MissionCrewListView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionCrewListView: View {
	
	@EnvironmentObject
	var viewModel: Self.ViewModel
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("Crew List")
				.font(.system(.title, design: .serif).bold())
				.padding(.bottom, 5)
				.padding(.horizontal)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(viewModel.crew, id: \.role) { crewMember in
						
						let eachAstronautViewModel = AstronautView.ViewModel(
							astronaut: crewMember.astronaut
						)
						
						NavigationLink {
							AstronautView(
								viewModel: eachAstronautViewModel
							)
						} label: {
							crewMemberView(of: crewMember)
								.padding(.leading)
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
				.scaledToFill()
				.frame(width: 64, height: 64)
				.clipShape(Circle())
				.overlay(
					Circle()
						.stroke(.moonshotLightColor)
				)
			
			VStack(alignment: .leading) {
				Text(member.astronaut.name)
					.font(.system(.body, design: .serif))
					.foregroundColor(.white)
					.padding(.bottom, 6)
				Text(member.role)
					.font(.system(.caption, design: .serif).italic())
					.foregroundColor(.secondary)
			}
		}
		.padding()
		.overlay(
			Capsule()
				.stroke(.moonshotLightColor)
			)
	}
}

struct MissionCrewListView_Previews: PreviewProvider {
	static private let missionViewModel = MissionView.ViewModel(
		mission: Missions.allMissions[0],
		astronauts: Astronauts.allAstronauts
	)
	static private let missionCrewListVM = MissionCrewListView.ViewModel(crew: missionViewModel.crew)
	
    static var previews: some View {
		MissionCrewListView()
			.environmentObject(missionCrewListVM)
			.preferredColorScheme(.dark)
    }
}
