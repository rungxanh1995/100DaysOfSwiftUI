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
	
	@State
	private var isShowingGridLayout = false
	
    var body: some View {
		NavigationView {
			Group {
				if isShowingGridLayout {
					HomeGridView(viewModel: viewModel)
				} else {
					HomeListView(viewModel: viewModel)
				}
			}
			.preferredColorScheme(.dark)
			.toolbar {
				switchLayoutButton
			}
		}
    }
}

private extension HomeView {
	
	@ViewBuilder
	private var switchLayoutButton: some View {
		Button {
			withAnimation(.easeInOut(duration: 1)) {
				isShowingGridLayout.toggle()
			}
		} label: {
			let layoutButtonTitle = isShowingGridLayout ? "Show List" : "Show Grid"
			let layoutButtonIcon = Image(systemName: isShowingGridLayout ? "rectangle.grid.1x2.fill" : "square.grid.2x2.fill")
			Label {
				Text(layoutButtonTitle)
			} icon: {
				layoutButtonIcon
			}
		}
		.buttonStyle(.bordered)
		.tint(.indigo)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
