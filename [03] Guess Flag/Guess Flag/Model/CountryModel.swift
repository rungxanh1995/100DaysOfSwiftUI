//
//  CountryModel.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation

struct CountryModel {
	let name: String
	let flag: CountryFlagModel
	
	static let sampleData: [CountryModel] = CountryModelStore.defaultStore
}
