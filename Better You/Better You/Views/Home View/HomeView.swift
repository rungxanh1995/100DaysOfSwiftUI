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
	
	@State
	var isShowingAddHabit: Bool = false
	
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
							NavigationLink {
								BYHabitDetailView(
									viewModel: .init(item: item)
								)
							} label: {
								HomeListCell(viewModel: .init(item: item))
							}
						}
						.onDelete(perform: viewModel.deleteDailyHabits)
					}
				}
				
				Section(
					header: Text("Weekly Habits")
				) {
					if viewModel.weeklyHabits.isEmpty {
						emptyHabitsText
					} else {
						ForEach(viewModel.weeklyHabits) { item in
							NavigationLink {
								BYHabitDetailView(
									viewModel: .init(item: item)
								)
							} label: {
								HomeListCell(viewModel: .init(item: item))
							}
						}
						.onDelete(perform: viewModel.deleteWeeklyHabits)
					}
				}
				
				Section(
					header: Text("Bi-weekly Habits")
				) {
					if viewModel.biweeklyHabits.isEmpty {
						emptyHabitsText
					} else {
						ForEach(viewModel.biweeklyHabits) { item in
							NavigationLink {
								BYHabitDetailView(
									viewModel: .init(item: item)
								)
							} label: {
								HomeListCell(viewModel: .init(item: item))
							}
						}
						.onDelete(perform: viewModel.deleteBiweeklyHabits)
					}
				}
				
				Section(
					header: Text("Monthly Habits")
				) {
					if viewModel.monthlyHabits.isEmpty {
						emptyHabitsText
					} else {
						ForEach(viewModel.monthlyHabits) { item in
							NavigationLink {
								BYHabitDetailView(
									viewModel: .init(item: item)
								)
							} label: {
								HomeListCell(viewModel: .init(item: item))
							}
						}
						.onDelete(perform: viewModel.deleteMonthlyHabits)
					}
				}
			}
			.navigationTitle("Better You")
			.toolbar {
				Button {
					isShowingAddHabit.toggle()
				} label: {
					Image(systemName: "plus")
				}
				.buttonStyle(.bordered)
			}
			.sheet(isPresented: $isShowingAddHabit) {
				AddHabitView(
					viewModel: .init(parentVM: self.viewModel)
				)
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
