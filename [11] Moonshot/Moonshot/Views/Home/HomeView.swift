//
//  ContentView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject
	var viewModel: HomeViewModel = HomeViewModel()
	
    var body: some View {
		TabView {
			NavigationView {
				HomeGridView(viewModel: viewModel)
			}
			.tabItem {
				Label("Grid", systemImage: "square.grid.2x2")
			}
			
			NavigationView {
				HomeListView(viewModel: viewModel)
			}
			.tabItem {
				Label("List", systemImage: "rectangle.grid.1x2")
			}
		}
		.preferredColorScheme(.dark)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
