//
//  Persistence.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

protocol Persitence {
	func encodeAndSave<T: Encodable>(_ items: T) -> Void
	func decodeAndReturnSavedDataOrNil<T: Decodable>(type: T.Type) -> T?
}
