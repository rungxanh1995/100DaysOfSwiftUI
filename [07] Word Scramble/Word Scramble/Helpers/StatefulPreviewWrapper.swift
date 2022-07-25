//
//  StatefulPreviewWrapper.swift
//
//  Created by Jim Dovey on 10/11/19.
//  Copyright © 2019 Jim Dovey. All rights reserved.
//	Link: https://github.com/AlanQuatermain/AQUI/blob/master/Sources/AQUI/StatefulPreviewWrapper.swift
//

import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct StatefulPreviewWrapper<Value, Content: View>: View {
	@State var value: Value
	var content: (Binding<Value>) -> Content
	
	public var body: some View {
		content($value)
	}
	
	public init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
		self._value = State(wrappedValue: value)
		self.content = content
	}
}

	// MARK: - How to use?

struct ExampleView: View {
	@Binding var enabled: Bool
	
	var body: some View {
		Text("Currently enabled? \(enabled ? "Yes" : "No")")
		Toggle("Toggle Me", isOn: $enabled)
	}
}

struct ExampleView_Previews: PreviewProvider {
	static var previews: some View {
		StatefulPreviewWrapper(false) { ExampleView(enabled: $0) }
	}
}
