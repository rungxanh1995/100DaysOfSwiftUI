//
//  URLSession+Ext.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import Foundation

fileprivate enum DecodingError: String, Error {
	case badURL = "Unable to decode URL"
	case badData = "Unable to decode data"
}

fileprivate enum NetworkingError: String, Error {
	case badResponse = "Invalid server response"
}

extension URLSession {
	
	/// Asynchronously fetches data over the Internet,
	/// and returns decoded data of type `T`
	///
	/// - Throws:
	/// 	- `DecodingError.badURL`
	/// 	if a URL string could not be converted to a proper `URL`
	///     - `NetworkingError.badResponse`
	///     if a network call from `resourceString` does not response properly
	///     - `DecodingError.badData`
	///     if the decoder could not decode data received into `T`.
	/// - Parameter resourceString: The raw URL string of resource to fetch data from
	/// - Returns: Decoded data of type `T`
	func decode<T: Decodable>(from resourceString: String) async throws -> T {
		guard let url = URL(string: resourceString) else {
			throw DecodingError.badURL
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkingError.badResponse
		}
		
		let decoder = JSONDecoder()
		guard let decoded = try? decoder.decode(T.self, from: data) else {
			throw DecodingError.badData
		}
		
		return decoded
	}
}
