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
			// TODO: Add view for friend list
		}
		.navigationTitle(user.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension UserView {
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
			
			Divider()
			
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
			Divider()
			Text(user.about)
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
			Divider()
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(user.tags, id: \.self) {
						tagChips(for: Text($0))
					}
				}
			}
		}
		.expandToInfinity()
		.padding()
		.asCard()
	}
	
	@ViewBuilder
	private func tagChips(for text: Text) -> some View {
		Button {
			// action code here
		} label: {
			text
				.font(.callout)
				.padding(8)
				.background(Color.accentColor.opacity(0.25))
				.clipShape(Capsule())
		}
	}
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
		UserView(user: User.sampleUser)
    }
}
