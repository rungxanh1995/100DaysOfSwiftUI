//
//  HapticManager.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-22.
//	From this tutorial: https://www.youtube.com/watch?v=DMBcjZjK844
//

import UIKit

fileprivate final class HapticManager {
	static let shared: HapticManager = .init()
	private let feedback: UINotificationFeedbackGenerator = .init()
	
	private init() { }
	
	func trigger(_ notifType: UINotificationFeedbackGenerator.FeedbackType) {
		feedback.notificationOccurred(notifType)
	}
}

func haptic(_ notifType: UINotificationFeedbackGenerator.FeedbackType) {
	HapticManager.shared.trigger(notifType)
}
