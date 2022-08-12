//
//  HomeViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension HomeView {
	final class ViewModel: ObservableObject {
		
		let astronauts: [String: Astronaut]
		let missions: [Mission]
		
		init(
			astronauts: [String: Astronaut] = Astronauts.allAstronauts,
			missions: [Mission] = Missions.allMissions
		) {
			self.astronauts = astronauts
			self.missions = missions
		}
	}
}
