//
//  BYPersistence.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

/// Implementation class for persistence in Better You app
final class BYPersistence: Persitence {
	
	private static let proxy = UserDefaults.standard
	
	private let habitType: HabitType
	
	init(habitType: HabitType) {
		self.habitType = habitType
	}
	
	private var persistenceKey: String {
		if type(of: Self.proxy) == UserDefaults.self {
			return "\(habitType.rawValue).habits"
		}
		
		return "genericKey"
	}
	
	func encodeAndSave<T: Encodable>(_ items: T) -> Void {
		if let encoded = try? JSONEncoder().encode(items) {
			Self.proxy.set(encoded, forKey: persistenceKey)
		}
	}
	
	func decodeAndReturnSavedDataOrNil<T: Decodable>(type: T.Type) -> T? {
		if let data = Self.proxy.object(forKey: persistenceKey) as? Data,
		   let object = try? JSONDecoder().decode(T.self, from: data) {
			return object
		}
		
		return nil
	}
}
