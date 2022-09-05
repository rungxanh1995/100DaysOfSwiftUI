//
//  UserDefaultWrapper.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//	Code by Antoine van der Lee
//	Link: https://www.avanderlee.com/swift/appstorage-explained/?utm_campaign=coschedule&utm_source=twitter&utm_medium=twannl&utm_content=%40AppStorage%20explained%20and%20replicated%20for%20a%20better%20alternative
//

import Foundation

/// - Authors: Antoine van der Lee
@propertyWrapper
struct UserDefault<Value> {
	let key: String
	let defaultValue: Value
	
	var wrappedValue: Value {
		get { fatalError("Wrapped value should not be used.") }
		set { fatalError("Wrapped value should not be used.") }
	}
	
	init(wrappedValue: Value, _ key: String) {
		self.defaultValue = wrappedValue
		self.key = key
	}
	
	public static subscript(
		_enclosingInstance instance: Preferences,
		wrapped wrappedKeyPath: ReferenceWritableKeyPath<Preferences, Value>,
		storage storageKeyPath: ReferenceWritableKeyPath<Preferences, Self>
	) -> Value {
		get {
			let container = instance.userDefaults
			let key = instance[keyPath: storageKeyPath].key
			let defaultValue = instance[keyPath: storageKeyPath].defaultValue
			return container.object(forKey: key) as? Value ?? defaultValue
		}
		set {
			let container = instance.userDefaults
			let key = instance[keyPath: storageKeyPath].key
			container.set(newValue, forKey: key)
			instance.preferencesChangedSubject.send(wrappedKeyPath)
		}
	}
}
