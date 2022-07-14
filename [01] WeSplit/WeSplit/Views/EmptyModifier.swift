//
//  EmptyModifier.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//	Source: https://medium.com/macoclock/conditional-views-in-swiftui-dc09c808bc30
//

import SwiftUI

struct EmptyModifier: ViewModifier {
	
	let isEmpty: Bool
	
	func body(content: Content) -> some View {
		Group {
			if isEmpty {
				EmptyView()
			} else {
				content
			}
		}
	}
}
