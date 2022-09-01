//
//  UserFriend.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import Foundation

/// Helps bridge the gap between a user and its friend list
/// and turn it into `User`\'s inner `Friend` type
struct UserFriend {
	let id: String
	let friend: User.Friend
}
