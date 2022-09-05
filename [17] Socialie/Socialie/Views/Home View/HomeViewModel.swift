//
//  HomeViewModel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

extension HomeView {
	/// View model specialized for `HomeView`
	final class ViewModel: ObservableObject {
		@Published
		private var cachedUsers: [CachedUser]
		
		@Published
		var searchText = ""
		
		var searchResults: [CachedUser] {
			if searchText.isEmpty {
				return cachedUsers
			} else {
				return cachedUsers.filter { cachedUser in
					cachedUser.name.contains(searchText)
				}
			}
		}
		
		private let dataCoordinator: DataCoordinator
		
		init(dataCoordinator: DataCoordinator = DataCoordinatorImpl.standard) {
			self.dataCoordinator = dataCoordinator
			cachedUsers = [CachedUser]()
		}
		
		@MainActor
		func fetchData() async -> Void {
			guard cachedUsers.isEmpty else { return }
			let fetchedUsers = await dataCoordinator.fetchData()
			dataCoordinator.updateCache(with: fetchedUsers)
			cachedUsers = dataCoordinator.fetchCache()
		}
		
		fileprivate func sortAlphabetically(_ input: inout [User]) {
			// Sort by name
			input = input.sorted { $0.name < $1.name }
		}
	}
}
