//
//  MissionListLabelViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension MissionListLabelView {
	final class ViewModel: ObservableObject {
		
		let mission: Mission
		
		init(mission: Mission) {
			self.mission = mission
		}
	}
}
