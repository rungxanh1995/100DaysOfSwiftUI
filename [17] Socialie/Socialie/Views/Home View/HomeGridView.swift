//
//  HomeGridView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeGridView: View {
	
	@ObservedObject
	var viewModel: HomeView.ViewModel
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				withAnimation {
					ForEach(viewModel.searchResults) { eachUser in
						NavigationLink(
							destination: UserView(vm: .init(
								user: eachUser,
								friends: eachUser.friends
							))
						) {
							HomeGridCell(user: eachUser)
						}
					}
				}
			}
			.padding()
		}
		.navigationTitle("Socialie")
	}
}

struct HomeGridView_Previews: PreviewProvider {
    static var previews: some View {
		HomeGridView(viewModel: .init())
    }
}
