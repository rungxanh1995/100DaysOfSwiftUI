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
		private var users: [User]
		
		@Published
		var searchText = ""
		
		var searchResults: [User] {
			if searchText.isEmpty {
				return users
			} else {
				return users.filter { user in
					user.name.contains(searchText)
				}
			}
		}
		
		private let apiService: ApiService
		
		init(apiService: ApiService = SocialieApiService()) {
			self.apiService = apiService
			users = [User]()
		}
		
		@MainActor
		func fetchData() async -> Void {
			guard users.isEmpty else { return }
			users = await apiService.fetchData()
		}
	}
}
