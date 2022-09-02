//
//  PreferenceWrapper.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//	Code by Antoine van der Lee
//	Link: https://www.avanderlee.com/swift/appstorage-explained/?utm_campaign=coschedule&utm_source=twitter&utm_medium=twannl&utm_content=%40AppStorage%20explained%20and%20replicated%20for%20a%20better%20alternative
//

import SwiftUI

@propertyWrapper
struct Preference<Value>: DynamicProperty {
	
	@ObservedObject
	private var preferencesObserver: PublisherObservableObject
	private let keyPath: ReferenceWritableKeyPath<Preferences, Value>
	private let preferences: Preferences
	
	init(_ keyPath: ReferenceWritableKeyPath<Preferences, Value>, preferences: Preferences = .standard) {
		self.keyPath = keyPath
		self.preferences = preferences
		let publisher = preferences
			.preferencesChangedSubject
			.filter { changedKeyPath in
				changedKeyPath == keyPath
			}.map { _ in () }
			.eraseToAnyPublisher()
		self.preferencesObserver = .init(publisher: publisher)
	}
	
	var wrappedValue: Value {
		get { preferences[keyPath: keyPath] }
		nonmutating set { preferences[keyPath: keyPath] = newValue }
	}
	
	var projectedValue: Binding<Value> {
		Binding(
			get: { wrappedValue },
			set: { wrappedValue = $0 }
		)
	}
}
