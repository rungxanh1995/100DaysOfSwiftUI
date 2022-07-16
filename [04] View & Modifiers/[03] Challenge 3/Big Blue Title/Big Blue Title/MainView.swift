//
//  ContentView.swift
//  Big Blue Title
//
//  Created by Joe Pham on 2022-07-16.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text("Hello, world!")
			.prominentBlueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
