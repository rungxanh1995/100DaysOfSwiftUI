//
//  MissionCrewListViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension MissionCrewListView {
	/// Use this view model as an `@EnvironmentObject`,
	/// as its initializer requires a parameter of type `[CrewMember]`.
	///
	/// Therefore, you would need its parent view to create this class's instance
	/// and pass an array of `CrewMember`\'s
	final class ViewModel: ObservableObject {
		
		let crew: [CrewMember]
		
		init(crew: [CrewMember]) {
			self.crew = crew
		}
	}
}
