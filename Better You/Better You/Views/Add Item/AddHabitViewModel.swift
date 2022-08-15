//
//  AddHabitViewModel.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import Foundation

extension AddHabitView {
	final class ViewModel: ObservableObject {
		private let listViewModel: HomeView.ViewModel
		
		init(parentVM: HomeView.ViewModel) {
			self.listViewModel = parentVM
		}
		
		@Published
		var habitName: String = ""
		
		@Published
		var habitCategory: HabitItem.Category = .daily
		
		@Published
		var habitCompletedTimes: Int = 1
		let reasonableCompletedTimes: ClosedRange<Int> = 0...100
		
		@Published
		var habitNotes: String = ""
		
		let habitCategories: [HabitItem.Category] = HabitItem.Category.allCases
		
		func addHabit(
			name: inout String,
			category: HabitItem.Category,
			completedTimes: Int,
			notes: String
		) -> Void {
			listViewModel.addHabit(name: &name, category: category, completedTimes: completedTimes, notes: notes)
		}
	}
}
