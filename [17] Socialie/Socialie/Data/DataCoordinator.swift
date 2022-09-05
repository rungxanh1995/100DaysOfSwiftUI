//
//  DataCoordinator.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//

import CoreData

protocol DataCoordinator {
	@MainActor
	func updateCache(with fetchedUsers: [User]) -> Void
	
	func fetchCache() -> [CachedUser]
	
	func fetchData() async -> [User]
}

/// The coordinator of data from fetching decoded API data
/// to caching them in persistence.
///
/// This is the primary actor of the "scope creep" challenge
/// of adding Core Data to Socialie.
final class DataCoordinatorImpl: DataCoordinator {
	
	/// Singleton instance to use in the app
	static let standard: DataCoordinatorImpl = .init()
	
	private let apiService: ApiService
	private let storageProvider: StorageProvider
	
	private init(
		apiService: ApiService = SocialieApiService(),
		storageProvider: StorageProvider = StorageProviderImpl.standard
	) {
		self.apiService = apiService
		self.storageProvider = storageProvider
	}
	
	@MainActor
	func updateCache(with fetchedUsers: [User]) -> Void {
		
		// Match each fetched user to cached user
		for fetchedUser in fetchedUsers {
			let cachedUser = CachedUser(context: storageProvider.context)
			match(fetchedUser, to: cachedUser)
			
			// Then match each fetched friend to cached friend
			for fetchedFriend in fetchedUser.friends {
				let cachedFriend = CachedFriend(context: storageProvider.context)
				match(fetchedFriend, to: cachedFriend)
				
				// Finally, add friends to each user
				cachedUser.addToCd_friends(cachedFriend)
			}
		}
		
		storageProvider.saveAndHandleError()
	}
	
	/// Assigns properties of a fetched `User` from the API
	/// to attributes of its sibling `CachedUser` in Core Data persistence store.
	fileprivate func match(_ fetched: User, to cached: CachedUser) -> Void {
		cached.cd_id = fetched.id
		cached.cd_isActive = fetched.isActive
		cached.cd_name = fetched.name
		cached.cd_age = Int16(fetched.age)
		cached.cd_company = fetched.company
		cached.cd_email = fetched.email
		cached.cd_address = fetched.address
		cached.cd_about = fetched.about
		cached.cd_registered = fetched.registered
		cached.cd_tags = fetched.tags
	}
	
	/// Assigns properties of a fetched `Friend` from the API
	/// to attributes of its sibling `CachedFriend` in Core Data persistence store.
	fileprivate func match(_ fetched: User.Friend, to cached: CachedFriend) -> Void {
		cached.cd_id = fetched.id
		cached.cd_name = fetched.name
	}
	
	func fetchCache() -> [CachedUser] {
		storageProvider.fetch()
	}
	
	func fetchData() async -> [User] {
		await apiService.fetchData()
	}
}
