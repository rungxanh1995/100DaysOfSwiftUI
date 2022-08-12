//
//  MissionsApiService.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-11.
//

import Foundation

/// Implementation class of `ApiService`
/// to fetch JSON data for space missions
final class MissionsApiService: ApiService {
	func fetchData<T>(completion: @escaping (T) -> Void) where T: Decodable {
		completion(Missions.allMissions as! T)
	}
}
