//
//  ContentView.swift
//  Unit Converter
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			Form {
				Text("Hello World")
			}.navigationTitle("Unit Converter")
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
