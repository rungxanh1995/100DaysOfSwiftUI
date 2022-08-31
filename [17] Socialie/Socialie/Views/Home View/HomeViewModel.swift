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
		var users: [User]
		
		private let apiService: ApiService
		
		init(apiService: ApiService = SocialieApiService()) {
			self.apiService = apiService
			users = [User]()
		}
		
		@MainActor
		func fetchData() async -> Void {
			if users.isEmpty {
				users = await apiService.fetchData()
			}
		}
	}
}