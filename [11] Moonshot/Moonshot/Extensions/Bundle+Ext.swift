//
//  Bundle+Ext.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import Foundation

extension Bundle {
	
	// MARK: - Decodable -
	func decode<T: Decodable>(_ filename: String, withExtension fileExtension: String) -> T {
		guard let url = self.url(forResource: filename, withExtension: fileExtension) else {
			fatalError("Failed to locate \(filename) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(filename) from bundle.")
		}
		
		let jsonDecoder = JSONDecoder()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "y-MM-dd"  // dates in `missions.json` are in this format
		jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
		
		guard let loaded = try? jsonDecoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(filename) from bundle.")
		}
		
		return loaded
	}
}
