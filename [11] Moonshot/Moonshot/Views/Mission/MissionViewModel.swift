//
//  MissionViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension MissionView {
	final class ViewModel: ObservableObject {
		
		let mission: Mission
		var crew: [CrewMember] { return _crew }
		/// Sidestep the initialization process of Swift with a private property
		private var _crew: [CrewMember]!
		
		init(mission: Mission, astronauts: [String: Astronaut]) {
			self.mission = mission
			self._crew = mapAstronautsToSpecificMissionCrew(astronauts)
		}
		
		private func mapAstronautsToSpecificMissionCrew(_ astronauts: [String: Astronaut]) -> [CrewMember] {
			mission.crew.map { eachMember in
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
	}
}
