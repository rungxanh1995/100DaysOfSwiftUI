//
//  Astronaut.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import Foundation

/// Partly correllates with how `astronauts.json` was formatted.
/// You would need to declare usage of it as a dictionary of `String` and `Astronaut`.
///
/// In which the `String` key is the name of an astronaut,
/// and `Astronaut` value is an astronaut object.
///
/// For example:
///
/// 	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts", withExtension: "json")
/// 	for eachAstronaut in astronauts.values {
/// 		print(eachAstronaut.name)
/// 	}
struct Astronaut: Codable, Identifiable {
	let id: String
	let name: String
	let description: String
}
