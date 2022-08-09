//
//  AstronautViewModel.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

class AstronautViewModel: ObservableObject {
	let astronaut: Astronaut
	
	init(astronaut: Astronaut) {
		self.astronaut = astronaut
	}
}
