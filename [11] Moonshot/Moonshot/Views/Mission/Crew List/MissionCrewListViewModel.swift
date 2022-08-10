//
//  MissionCrewListViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

/// Relies on its parent view model of type `MissionViewModel`,
/// due to the way the original source JSON is structured:
/// each Apollo mission's crew members is mapped to a
/// corresponding astronauts name.
///
/// I couldn't pass a mission object to its initializer, because its crew
/// is of `Mission`\'s nested type `Crew`, and not compatible
/// with `CrewMember` type
final class MissionCrewListViewModel: ObservableObject {
	
	let crew: [CrewMember]
	
	init(parentVM: MissionViewModel) {
		self.crew = parentVM.crew
	}
}
