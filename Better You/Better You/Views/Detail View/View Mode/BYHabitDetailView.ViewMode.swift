//
//  BYHabitDetailView.ViewMode.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import SwiftUI

extension BYHabitDetailView {
	
	struct ViewMode: View {
		
		@ObservedObject
		var viewModel: BYHabitDetailView.ViewModel
		
		let columns = [
			GridItem(.adaptive(minimum: 150, maximum: 180))
		]
		
		@State
		var isShowingEditHabit: Bool = false
		
		var body: some View {
			ScrollView {
				LazyVGrid(columns: columns) {
					BYHabitDetailCell(
						title: viewModel.item.name,
						caption: "Name"
					)
					
					BYHabitDetailCell(
						title: viewModel.item.notes,
						caption: "Notes"
					)
					
					BYHabitDetailCell(
						title: viewModel.item.category.rawValue,
						caption: "Frequency"
					)
					
					BYHabitDetailCell(
						title: viewModel.item.startDate.formatted(date: .abbreviated, time: .omitted),
						caption: "Start Date"
					)
					
					BYHabitDetailCell(
						title: viewModel.item.completedTimes.formatted(),
						caption: "Completed Times"
					)
				}
				.padding([.horizontal, .bottom])
				
				Text("Last updated at \(viewModel.item.lastUpdated.formatted(date: .numeric, time: .shortened))")
					.font(.system(.caption, design: .rounded))
					.foregroundColor(viewModel.colorForLastUpdated())
			}
			.navigationTitle("Habit Detail")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				Button("Edit") { isShowingEditHabit.toggle() }
			}
			.sheet(isPresented: $isShowingEditHabit) {
				Text("Edit screen for habit: \(viewModel.item.name)")
			}
		}
	}
}
