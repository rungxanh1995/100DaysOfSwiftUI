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
					
					VStack(alignment: .leading) {
						Text("Crew List")
							.font(.system(.title, design: .serif).bold())
							.padding(.bottom, 5)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(viewModel.crew, id: \.role) { crewMember in
									let eachAstronautViewModel = AstronautViewModel(
										astronaut: crewMember.astronaut
									)
									
									NavigationLink {
										AstronautView(
											viewModel: eachAstronautViewModel)
									} label: {
										HStack {
											Image(crewMember.astronaut.id)
												.resizable()
												.frame(width: 104, height: 72)
												.clipShape(Circle())
												.overlay(
													Circle()
														.strokeBorder(.moonshotLightColor, lineWidth: 1)
												)
											
											VStack(alignment: .leading) {
												Text(crewMember.astronaut.name)
													.foregroundColor(.white)
													.font(.system(.headline, design: .serif))
												Text(crewMember.role)
													.font(.system(.callout, design: .serif))
													.foregroundColor(.secondary)
											}
										}
										.padding(.trailing)
									}
								}
							}
						}
					}
					.padding(.horizontal)
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
