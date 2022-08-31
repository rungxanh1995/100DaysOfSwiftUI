//
//  HomeView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject
	private var vm: Self.ViewModel
	
	init(vm: Self.ViewModel = .init()) {
		_vm = StateObject(wrappedValue: vm)
	}
	
	@State
	private var isGridLayout: Bool = true
	
    var body: some View {
		NavigationView {
			Group {
				if isGridLayout {
					HomeGridView(viewModel: vm)
				} else {
					HomeListView(viewModel: vm)
				}
			}
			.task {
				await vm.fetchData()
			}
			.toolbar {
				layoutSwitchButton
			}
		}
    }
}

private extension HomeView {
	@ViewBuilder
	var layoutSwitchButton: some View {
		Button {
			isGridLayout.toggle()
		} label: {
			Label(
				"Layout",
				systemImage: isGridLayout ? "list.bullet" : "square.grid.2x2.fill"
			)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
