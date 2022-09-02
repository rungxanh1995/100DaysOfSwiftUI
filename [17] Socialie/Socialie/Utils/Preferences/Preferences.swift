//
//  Preferences.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//	Code by Antoine van der Lee
//	Link: https://www.avanderlee.com/swift/appstorage-explained/?utm_campaign=coschedule&utm_source=twitter&utm_medium=twannl&utm_content=%40AppStorage%20explained%20and%20replicated%20for%20a%20better%20alternative
//

import Combine
import Foundation

final class Preferences {
	static let standard = Preferences(userDefaults: .standard)
	internal let userDefaults: UserDefaults
	
	/// Sends through the changed keypath whenever a change occurs
	var preferencesChangedSubject = PassthroughSubject<AnyKeyPath, Never>()
	
	init(userDefaults: UserDefaults) {
		self.userDefaults = userDefaults
	}
	
	@UserDefault(UserDefaultsKey.hapticsEnabled)
	var isHapticsEnabled: Bool = true
	
	@UserDefault(UserDefaultsKey.systemTheme)
	var systemTheme: Int = SchemeType.allCases.first!.rawValue
}







