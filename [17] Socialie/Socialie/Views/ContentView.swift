//
//  ContentView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject
	private var vm: Self.ViewModel
	
	init(vm: Self.ViewModel = .init()) {
		_vm = StateObject(wrappedValue: vm)
	}
	
    var body: some View {
        Text("Hello, world!")
            .padding()
			.task {
				await vm.fetchData()
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
