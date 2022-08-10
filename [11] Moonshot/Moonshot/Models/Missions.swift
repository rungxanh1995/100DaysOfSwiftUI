//
//  Missions.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import Foundation

struct Missions {
	static let allMissions: [Mission] = Bundle.main.decode(
		"missions",
		withExtension: "json"
	)
}
