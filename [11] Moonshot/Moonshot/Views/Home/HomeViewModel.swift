//
//  HomeViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

class HomeViewModel: ObservableObject {
	
	let astronauts = Astronauts.allAstronauts
	let missions = Missions.allMissions
	
}
