//
//  UserFriend.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import Foundation

/// Helps bridge the gap between a cached user and its friend list
struct UserFriend {
	let id: String
	let friend: CachedFriend
}
