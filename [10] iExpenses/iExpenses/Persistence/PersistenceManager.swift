//
//  PersistenceManager.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import Foundation

class PersistenceManager {
	
	private static let proxy = UserDefaults.standard
	
	private static var persistenceKey: String {
		if type(of: Self.proxy) == UserDefaults.self {
			return "iExpenses"
		}
		
		return "genericKey"
	}
	
	static func encodeAndSave(_ items: [ExpenseItem]) -> Void {
		if let encoded = try? JSONEncoder().encode(items) {
			Self.proxy.set(encoded, forKey: persistenceKey)
		}
	}
	
	static func decodeAndReturnSavedData<T: Decodable>(type: T.Type) -> T? {
		if let data = Self.proxy.object(forKey: persistenceKey) as? Data,
		   let object = try? JSONDecoder().decode(T.self, from: data) {
			return object
		}
		
		return nil
	}
}
