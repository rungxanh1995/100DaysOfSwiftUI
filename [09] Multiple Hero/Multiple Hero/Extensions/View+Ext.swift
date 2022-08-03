//
//  View+Ext.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import SwiftUI

extension View {
	func wiggling() -> some View {
		modifier(WiggleModifier())
	}
}
