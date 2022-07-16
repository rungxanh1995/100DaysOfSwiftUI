//
//  View+Ext.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//

import SwiftUI

extension View {
	/// Whether the view should be empty.
	/// - Parameter bool: Set to `true` to hide the view (return EmptyView instead). Set to `false` to show the view.
	func isEmpty(_ bool: Bool) -> some View {
		modifier(EmptyModifier(isEmpty: bool))
	}
}
