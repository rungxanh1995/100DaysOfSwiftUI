//
//  AstronautsApiService.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-11.
//

import Foundation

/// Implementation class of `ApiService`
/// to fetch JSON data for astronauts
final class AstronautsApiService: ApiService {
	func fetchData<T>(completion: @escaping (T) -> Void) where T: Decodable {
		completion(Astronauts.allAstronauts as! T)
	}
}
