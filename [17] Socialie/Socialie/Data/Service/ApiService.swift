//
//  ApiService.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

protocol ApiService {
	func fetchData<T: Decodable>() async -> T
}

final class SocialieApiService: ApiService {
	func fetchData<T>() async -> T where T : Decodable {
		var decodedUsers: [User] = [User]()
		try? await fetchAndHandleError(for: &decodedUsers)
		return decodedUsers as! T
	}
	
	fileprivate func fetchAndHandleError(for decoded: inout [User]) async throws -> Void {
		do {
			decoded = try await URLSession.shared
				.decode(from: Constants.Url.friendfaceURLString)
		} catch {
			// Errors thrown should already be handled in `URLSession+Ext.swift`
		}
	}
}
