//
//  UserFriendListViewModel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import Foundation

extension UserFriendList {
	/// Use this view model as an `@EnvironmentObject`,
	/// as its initializer requires a parameter of type `[UserFriend]`.
	///
	/// Therefore, you would need its parent view to create this class's instance
	/// and pass an array of `UserFriend`\'s
	final class ViewModel: ObservableObject {
		let userFriends: [UserFriend]
		
		init(friends: [UserFriend]) {
			self.userFriends = friends
		}
	}
}
