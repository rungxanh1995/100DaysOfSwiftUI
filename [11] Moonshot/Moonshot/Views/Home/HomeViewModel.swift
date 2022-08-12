//
//  HomeViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension HomeView {
	final class ViewModel: ObservableObject {
		
		var astronauts = [String: Astronaut]()
		var missions = [Mission]()
		
		private let astronautsApiService: ApiService
		private let missionsApiService: ApiService
		
		init(
			astronautsApiService: ApiService = AstronautsApiService(),
			missionsApiService: ApiService = MissionsApiService()
		) {
			self.astronautsApiService = astronautsApiService
			self.missionsApiService = missionsApiService
		}
		
		func getData() -> Void {
			astronautsApiService.fetchData { [weak self] decodedAstronautsDict in
				self?.astronauts = decodedAstronautsDict
			}
			
			missionsApiService.fetchData { [weak self] decodedMissions in
				self?.missions = decodedMissions
			}
		}
	}
}
