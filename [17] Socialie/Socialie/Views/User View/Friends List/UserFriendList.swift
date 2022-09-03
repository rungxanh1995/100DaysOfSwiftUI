//
//  UserFriendList.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

struct UserFriendList: View {
	
	@EnvironmentObject
	var vm: Self.ViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Spacer()
				Text("Friends")
					.font(.title3.bold())
				Spacer()
			}
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(vm.userFriends, id: \.id) { userFriend in
						NavigationLink {
							// Spared for when I'm able to deploy a dedicated view
							UnderDevelopmentView()
						} label: {
							Text(userFriend.friend.name)
								.asTagChip()
						}
					}
				}
			}
		}
	}
}
