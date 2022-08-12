//
//  HomeViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension HomeView {
	final class ViewModel: ObservableObject {
		
		private(set) var astronauts = [String: Astronaut]()
		private(set) var missions = [Mission]()
		
		init(
			astronautsApiService: ApiService = AstronautsApiService(),
			missionsApiService: ApiService = MissionsApiService()
		) {
			astronautsApiService.fetchData { [weak self] decodedAstronautsDict in
				self?.astronauts = decodedAstronautsDict
			}
			
			missionsApiService.fetchData { [weak self] decodedMissions in
				self?.missions = decodedMissions
			}
		}
	}
}
