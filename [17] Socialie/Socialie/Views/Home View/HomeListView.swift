//
//  HomeListView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeListView: View {
	@ObservedObject
	var viewModel: HomeView.ViewModel
	
    var body: some View {
		List(viewModel.searchResults) { eachUser in
			NavigationLink(
				destination: UserView(vm: .init(
					user: eachUser,
					friends: eachUser.friends
				))
			) {
				HomeListCell(user: eachUser)
				
			}
		}
		.navigationTitle("Socialie")
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
		HomeListView(viewModel: .init())
    }
}
