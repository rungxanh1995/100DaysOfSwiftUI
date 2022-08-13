//
//  HomeView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject
	var viewModel: ViewModel
	
	init(viewModel: HomeView.ViewModel = .init()) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("Daily Habits")
				) {
					if viewModel.dailyHabits.isEmpty {
						emptyHabitsText
					} else {
						ForEach(viewModel.dailyHabits) { item in
							HStack(alignment: .top) {
								VStack(alignment: .leading) {
									Text(item.name)
										.font(.system(.headline, design: .rounded))
									
									if item.notes != "" {
										Text(item.notes)
											.font(.system(.caption2, design: .rounded))
											.foregroundColor(.secondary)
											.fixedSize(horizontal: false, vertical: true)
									}
								}
								
								Spacer()
								
								Text("\(item.completedTimes)")
								.font(.system(.callout, design: .monospaced).bold())
							}
						}
					}
				}
			}
			.navigationTitle("Better You")
			.toolbar {
				Button {
					// code to pull up add view
				} label: {
					Image(systemName: "plus")
				}
				.buttonStyle(.bordered)
			}
		}
    }
}

extension HomeView {
	@ViewBuilder
	private var emptyHabitsText: some View {
		
		let emptyHabitListSentence: LocalizedStringKey = "Nothing yet. Tap \(Image(systemName: "plus.rectangle.fill")) to add more"
		
		HStack {
			Spacer()
			Text(emptyHabitListSentence)
				.font(.system(.callout, design: .rounded))
				.foregroundColor(.secondary)
			Spacer()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
