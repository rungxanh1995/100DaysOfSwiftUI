//
//  AstronautViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

extension AstronautView {
	final class ViewModel: ObservableObject {
		let astronaut: Astronaut
		
		init(astronaut: Astronaut) {
			self.astronaut = astronaut
		}
	}
}
