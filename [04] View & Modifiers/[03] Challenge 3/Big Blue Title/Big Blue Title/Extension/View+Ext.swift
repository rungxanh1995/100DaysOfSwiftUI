//
//  View+Ext.swift
//  Big Blue Title
//
//  Created by Joe Pham on 2022-07-16.
//

import SwiftUI

extension View {
	
	func prominentBlueTitle() -> some View {
		modifier(BigBlueTitleModifier())
	}
}
