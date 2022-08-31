//
//  ContentViewModel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

extension HomeView {
	/// View model specialized for `ContentView`
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
			users = await apiService.fetchData()
		}
	}
}
