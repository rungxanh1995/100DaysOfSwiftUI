//
//  BYPersistence.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

/// Implementation class for persistence in Better You app
final class BYPersistence: Persistence {
	
	private static let proxy = UserDefaults.standard
	
	private let habitCategory: HabitItem.Category
	
	init(habitCategory: HabitItem.Category) {
		self.habitCategory = habitCategory
	}
	
	private var persistenceKey: String {
		if type(of: Self.proxy) == UserDefaults.self {
			return "\(habitCategory.rawValue).habits"
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
