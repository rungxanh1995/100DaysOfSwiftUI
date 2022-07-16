//
//  CountryModelStore.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation

struct CountryModelStore {
	
	static let defaultStore: [CountryModel] = {
		var data = [CountryModel]()
		data.append(CountryModel(name: "Estonia", flag: CountryFlagModel.sampleData.element(0)))
		data.append(CountryModel(name: "France", flag: CountryFlagModel.sampleData.element(1)))
		data.append(CountryModel(name: "Germany", flag: CountryFlagModel.sampleData.element(2)))
		data.append(CountryModel(name: "Ireland", flag: CountryFlagModel.sampleData.element(3)))
		data.append(CountryModel(name: "Italy", flag: CountryFlagModel.sampleData.element(4)))
		data.append(CountryModel(name: "Nigeria", flag: CountryFlagModel.sampleData.element(5)))
		data.append(CountryModel(name: "Poland", flag: CountryFlagModel.sampleData.element(6)))
		data.append(CountryModel(name: "Russia", flag: CountryFlagModel.sampleData.element(7)))
		data.append(CountryModel(name: "Spain", flag: CountryFlagModel.sampleData.element(8)))
		data.append(CountryModel(name: "UK", flag: CountryFlagModel.sampleData.element(9)))
		data.append(CountryModel(name: "US", flag: CountryFlagModel.sampleData.element(10)))
		return data
	}()
}
