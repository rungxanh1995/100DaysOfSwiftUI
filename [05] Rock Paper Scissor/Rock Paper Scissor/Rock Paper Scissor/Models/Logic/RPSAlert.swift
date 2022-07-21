//
//  RPSAlert.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import SwiftUI

struct RPSAlert {
	private(set) var title: LocalizedStringKey = ""
	private(set) var message: LocalizedStringKey = ""
	
	mutating func updateContent(title: LocalizedStringKey, message: LocalizedStringKey) {
		self.title = title
		self.message = message
	}
}
