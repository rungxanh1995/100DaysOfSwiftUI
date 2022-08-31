//
//  View+Ext.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

extension View {
	func asCard() -> some View {
		modifier(CardModifier())
	}
}
