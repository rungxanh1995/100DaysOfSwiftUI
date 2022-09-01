//
//  UserView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct UserView: View {
	@ObservedObject
	private(set) var vm: Self.ViewModel
	
    var body: some View {
		ScrollView {
			mainInfoCard
			contactCard
			aboutCard
			tagsCard
			friendListCard
		}
		.navigationTitle(vm.user.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension UserView {
	
	// MARK: - Friend list card
	@ViewBuilder
	var friendListCard: some View {
		UserFriendList()
			.expandToInfinity()
			.padding()
			.asCard()
			.environmentObject(
				UserFriendList.ViewModel(friends: vm.friends)
			)
	}
	
	// MARK: - Main user info card
	@ViewBuilder
	var mainInfoCard: some View {
		VStack(alignment: .leading) {
			// Main content
			HStack(spacing: 20) {
				HomeCellImage(user: vm.user)
				VStack(alignment: .leading) {
					// Name
					Text(vm.user.name)
						.font(.title3.bold())
						.foregroundColor(Color.accentColor)
					// Age and Active status
					HStack(spacing: 4) {
						Text("\(vm.user.age) years old")
							.font(.callout)
						Text("•")
						Text(vm.user.isActive ? "Online" : "Offline")
							.font(.callout)
							.foregroundColor(vm.user.isActive ? .green : .secondary)
					}
				}
			}
			
			Divider()
			
			// Footer
			VStack {
				Text("Joined \(vm.user.formattedRegisterDate)")
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
				Text("Working at \(vm.user.company)")
			}
			.padding(.vertical, 4)
			
			// Email
			HStack {
				Symbols.Images.email
					.accessibilityLabel("Email")
				Link(vm.user.email, destination: URL(string: "mailto:\(vm.user.email)")!)
			}
			.padding(.vertical, 4)
			
			// Address
			HStack {
				Symbols.Images.map
					.accessibilityLabel("Address")
				Text(vm.user.address)
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
			Text(vm.user.about)
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
					ForEach(vm.user.tags, id: \.self) {
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
		let user = User.sampleUser
		UserView(vm: .init(user: user, friends: user.friends))
    }
}
