//
//  CountryFlag.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation

struct CountryFlagModel: Hashable {
	let imageName: String
	
	static let sampleData: [CountryFlagModel] = CountryFlagModelStore.defaultStore
}
