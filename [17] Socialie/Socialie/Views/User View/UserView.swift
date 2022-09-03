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
			friendListCard
			aboutCard
			tagsCard
		}
		.navigationTitle(vm.user.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension UserView {
	
	// MARK: - Main user info card
	@ViewBuilder
	var mainInfoCard: some View {
		VStack(alignment: .center) {
			HStack(alignment: .top) {
				HomeCellImage(user: vm.user)
					.padding([.leading, .bottom, .trailing], 8)
				VStack(alignment: .center) {
					// Name
					Text(vm.user.name)
						.font(.title3.bold())
						.foregroundColor(Color.accentColor)
						.padding(8)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor.opacity(0.2))
						
						.clipShape(Capsule())
					// Age and Active status
					HStack(spacing: 4) {
						Text("\(vm.user.age) years old")
							.font(.callout)
						Text("•")
						Text(vm.user.isActive ? "Online" : "Offline")
							.font(.callout)
							.foregroundColor(vm.user.isActive ? .green : .secondary)
					}
					
					Text("Joined \(vm.user.yearsAndMonthsSinceRegisteredUntilNow) ago on \(vm.user.formattedRegisterDate)")
						.font(.caption)
						.foregroundColor(.secondary)
				}
			}
		}
		.expandToInfinity()
		.padding()
	}
	
	// MARK: - Contact card
	@ViewBuilder
	var contactCard: some View {
		VStack(alignment: .leading) {
			HStack {
				Spacer()
				Text("Contact")
					.font(.title3.bold())
				Spacer()
			}
			
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
	
	// MARK: - About card
	@ViewBuilder
	var aboutCard: some View {
		VStack(alignment: .leading) {
			HStack {
				Spacer()
				Text("About")
					.font(.title3.bold())
				Spacer()
			}
			
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
			HStack {
				Spacer()
				Text("Tags")
					.font(.title3.bold())
				Spacer()
			}
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(vm.user.tags, id: \.self) { tag in
						NavigationLink {
							// Spared for when I'm able to deploy a dedicated view
							UnderDevelopmentView()
						} label: {
							Text(tag)
								.asTagChip()
						}
					}
				}
			}
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//		let user = User.sampleUser
//		UserView(vm: .init(user: user, friends: user.friends))
//    }
//}
