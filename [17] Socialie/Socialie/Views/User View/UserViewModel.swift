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
		let user: CachedUser
		var friends: [UserFriend] { return _friends }
		private var _friends: [UserFriend]!
		
		init(user: CachedUser, friends: [CachedFriend]) {
			self.user = user
			self._friends = mapFriendsToUserFriendsList(friends)
		}
		
		fileprivate func mapFriendsToUserFriendsList(_ friends: [CachedFriend]) -> [UserFriend] {
			user.friends.map { cachedFriend in
				return UserFriend(
					id: UUID().uuidString,
					friend: cachedFriend
				)
			}
		}
	}
}
