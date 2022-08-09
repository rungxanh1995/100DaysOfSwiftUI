//
//  Astronauts.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

struct Astronauts {
	/// Data type is `[String: Astronaut]` because of how
	/// its source JSON was structured.
	///
	/// The `String` key is an astronaut's name.
	/// The `Astronaut` value is an astronaut object.
	static let allAstronauts: [String: Astronaut] = Bundle.main.decode(
		"astronauts",
		withExtension: "json"
	)
}
