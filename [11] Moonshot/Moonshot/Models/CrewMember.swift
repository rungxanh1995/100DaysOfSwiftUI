//
//  CrewMember.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

/// A designated struct to serve mapping a `Mission.Crew` type.
/// Check out `MissionViewModel.swift` for implementation of this mapping.
///
/// Though it's similar to `Mission.Crew` from its look,
/// these two structs are not similar in structure.
struct CrewMember {
	let role: String
	let astronaut: Astronaut
}
