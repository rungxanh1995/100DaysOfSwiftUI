//
//  MHMascot.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import Foundation

/// Provides random animal mascot for each game round
struct MHMascot {
	
	private static let allAnimalIconNames = [
		"bear",
		"buffalo",
		"chick",
		"chicken",
		"cow",
		"crocodile",
		"dog",
		"duck",
		"elephant",
		"frog",
		"giraffe",
		"goat",
		"gorilla",
		"hippo",
		"horse",
		"monkey",
		"moose",
		"narwhal",
		"owl",
		"panda",
		"parrot",
		"penguin",
		"pig",
		"rabbit",
		"rhino",
		"sloth",
		"snake",
		"walrus",
		"whale",
		"zebra"
	]
	
	static func randomMascotName() -> String {
		return allAnimalIconNames.randomElement()!
	}
}
