//
//  HomeView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct HomeView: View {
	
	/// Helps selecting the layout of `HomeView`
	private enum Layout {
		case asGrid
		case asList
	}
	
	@StateObject
	private var vm: Self.ViewModel
	
	@State
	private var selectedLayout: Layout
	
	init(vm: Self.ViewModel = .init()) {
		_vm = StateObject(wrappedValue: vm)
		selectedLayout = .asGrid
	}
	
    var body: some View {
		NavigationView {
			Group {
				switch selectedLayout {
					case .asGrid: HomeGridView(viewModel: vm)
					case .asList: HomeListView(viewModel: vm)
				}
			}
			.task {
				await vm.fetchData()
			}
			.refreshable {
				await vm.fetchData()  // Pull to refresh
			}
			.toolbar {
				layoutSwitcher
			}
			.searchable(
				text: $vm.searchText,
				prompt: "Names"
			) {
				// Suggest search results
				ForEach(vm.searchResults, id: \.self) { (suggestedUser: CachedUser) in
					Text("Looking for \(suggestedUser.name)?")
						.searchCompletion(suggestedUser.name)
						.foregroundColor(.primary)
				}
			}
		}
    }
}

private extension HomeView {
	@ViewBuilder
	var layoutSwitcher: some View {
		Picker("Choose layout", selection: $selectedLayout) {
			Symbols.Labels.grid
				.tag(Layout.asGrid)
			
			Symbols.Labels.list
				.tag(Layout.asList)
		}
		.pickerStyle(.segmented)
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
