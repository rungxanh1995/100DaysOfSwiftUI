//
//  MissionView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct MissionView: View {
	internal struct CrewMember {
		let role: String
		let astronaut: Astronaut
	}
	
	let mission: Mission
	let crew: [CrewMember]
	
	init(mission: Mission, astronauts: [String: Astronaut]) {
		self.mission = mission
		
		self.crew = mission.crew.map { eachMember in
			if let astronaut = astronauts[eachMember.name] {
				return CrewMember(
					role: eachMember.role,
					astronaut: astronaut
				)
			} else {
				fatalError("Missing \(eachMember.name)")
			}
		}
	}
	
	var body: some View {
		GeometryReader { geometry in
			ScrollView {
				VStack {
					Image(mission.imageName)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geometry.size.width * 0.6)
						.padding(.top)
					
					/// Divider
					Rectangle()
						.frame(height: 1)
						.foregroundColor(.moonshotLightColor)
						.frame(maxWidth: geometry.size.width * 0.9)
						.padding(.vertical)
					
					VStack(alignment: .leading) {
						Text("Mission Highlights")
							.font(.system(.title, design: .serif).bold())
							.padding(.bottom, 5)
						
						Text(mission.description)
							.font(.system(.body, design: .serif))
					}
					.padding(.horizontal)
					
					/// Divider
					Rectangle()
						.frame(height: 1)
						.foregroundColor(.moonshotLightColor)
						.frame(maxWidth: geometry.size.width * 0.9)
						.padding(.vertical)
					
					VStack(alignment: .leading) {
						Text("Crew List")
							.font(.system(.title, design: .serif).bold())
							.padding(.bottom, 5)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(crew, id: \.role) { crewMember in
									NavigationLink {
										AstronautView(astronaut: crewMember.astronaut)
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
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.moonshotDarkColor)
	}
}

struct MissionView_Previews: PreviewProvider {
	
	static private let missions: [Mission] = Bundle.main.decode("missions", withExtension: "json")
	static private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts", withExtension: "json")
	
    static var previews: some View {
		MissionView(mission: missions[0], astronauts: astronauts)
			.preferredColorScheme(.dark)
    }
}
