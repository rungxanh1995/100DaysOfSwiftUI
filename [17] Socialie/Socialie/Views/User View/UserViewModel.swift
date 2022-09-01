//
//  UserViewModel.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import Foundation

extension UserView {
	/// View model specialized for `UserView`
	final class ViewModel: ObservableObject {
		let user: User
		var friends: [UserFriend] { return _friends }
		private var _friends: [UserFriend]!
		
		init(user: User, friends: [User.Friend]) {
			self.user = user
			self._friends = mapFriendsToUserFriendsList(friends)
		}
		
		fileprivate func mapFriendsToUserFriendsList(_ friends: [User.Friend]) -> [UserFriend] {
			user.friends.map { eachFriend in
				return UserFriend(id: eachFriend.id, friend: eachFriend)
			}
		}
	}
}
