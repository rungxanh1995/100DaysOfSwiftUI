//
//  CountryFlagModelStore.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-15.
//

import Foundation

struct CountryFlagModelStore {
	
	static let defaultStore: [CountryFlagModel] = {
		var data = [CountryFlagModel]()
		data.append(CountryFlagModel(imageName: "Estonia"))
		data.append(CountryFlagModel(imageName: "France"))
		data.append(CountryFlagModel(imageName: "Germany"))
		data.append(CountryFlagModel(imageName: "Ireland"))
		data.append(CountryFlagModel(imageName: "Italy"))
		data.append(CountryFlagModel(imageName: "Nigeria"))
		data.append(CountryFlagModel(imageName: "Poland"))
		data.append(CountryFlagModel(imageName: "Russia"))
		data.append(CountryFlagModel(imageName: "Spain"))
		data.append(CountryFlagModel(imageName: "UK"))
		data.append(CountryFlagModel(imageName: "US"))
		return data
	}()
}
