//
//  UserView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct UserView: View {
	private(set) var user: User
	
    var body: some View {
		ScrollView {
			mainInfoCard
			contactCard
			aboutCard
			tagsCard
			friendListCard
		}
		.navigationTitle(user.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension UserView {
	
	// MARK: - Friend list card
	@ViewBuilder
	var friendListCard: some View {
		let userFriends: [UserFriend] = mapFriendsToUserFriendsList(user.friends)
		
		return VStack(alignment: .leading) {
			Text("Friends")
				.font(.title2.bold())
				.foregroundColor(Color.accentColor)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(userFriends, id: \.id) { userFriend in
						NavigationLink {
							Text(userFriend.friend.name)
						} label: {
							Text(userFriend.friend.name)
						}
					}
				}
			}
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
	
	func mapFriendsToUserFriendsList(_ friends: [User.Friend]) -> [UserFriend] {
		user.friends.map { eachFriend in
			return UserFriend(id: eachFriend.id, friend: eachFriend)
		}
	}
	
	// MARK: - Main user info card
	@ViewBuilder
	var mainInfoCard: some View {
		VStack(alignment: .leading) {
			// Main content
			HStack(spacing: 20) {
				HomeCellImage(user: user)
				VStack(alignment: .leading) {
					// Name
					Text(user.name)
						.font(.title3.bold())
						.foregroundColor(Color.accentColor)
					// Age and Active status
					HStack(spacing: 4) {
						Text("\(user.age) years old")
							.font(.callout)
						Text("•")
						Text(user.isActive ? "Online" : "Offline")
							.font(.callout)
							.foregroundColor(user.isActive ? .green : .secondary)
					}
				}
			}
			
			Divider()
			
			// Footer
			VStack {
				Text("Joined \(user.formattedRegisterDate)")
					.font(.caption)
					.foregroundColor(.secondary)
			}
			.frame(maxWidth: .infinity)
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
	
	// MARK: - Contact card
	@ViewBuilder
	var contactCard: some View {
		VStack(alignment: .leading) {
			Text("Contact")
				.font(.title2.bold())
				.foregroundColor(Color.accentColor)
			
			// Company name
			HStack {
				Symbols.Images.building
					.accessibilityLabel("Company")
				Text("Working at \(user.company)")
			}
			.padding(.vertical, 4)
			
			// Email
			HStack {
				Symbols.Images.email
					.accessibilityLabel("Email")
				Link(user.email, destination: URL(string: "mailto:\(user.email)")!)
			}
			.padding(.vertical, 4)
			
			// Address
			HStack {
				Symbols.Images.map
					.accessibilityLabel("Address")
				Text(user.address)
			}
			.padding(.vertical, 4)
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
	
	// MARK: - About card
	@ViewBuilder
	var aboutCard: some View {
		VStack(alignment: .leading) {
			Text("About")
				.font(.title2.bold())
				.foregroundColor(Color.accentColor)
			Text(user.about)
				.padding(.vertical, 4)
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
	
	// MARK: - Tags card
	@ViewBuilder
	var tagsCard: some View {
		VStack(alignment: .leading) {
			Text("Tags")
				.font(.title2.bold())
				.foregroundColor(Color.accentColor)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(user.tags, id: \.self) {
						Text($0).asTagChip()
					}
				}
			}
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
		UserView(user: User.sampleUser)
    }
}
