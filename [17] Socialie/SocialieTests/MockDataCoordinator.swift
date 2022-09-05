//
//  MockDataCoordinator.swift
//  SocialieTests
//
//  Created by Joe Pham on 2022-09-05.
//

import Foundation
@testable import Socialie

final class MockDataCoordinator: DataCoordinator {
	var users = [User]()
	
	@MainActor
	func updateCache(with fetchedUsers: [User]) -> Void {
		return
	}
	
	func fetchCache() -> [CachedUser] {
		return [CachedUser]()
	}
	
	func fetchData() async -> [User] {
		return users
	}
}
