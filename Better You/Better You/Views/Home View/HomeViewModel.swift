//
//  HomeViewModel.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

extension HomeView {
	
	final class ViewModel: ObservableObject {
		// MARK: - Persistence Properties
		private let persistenceHandler: BYPersistenceHandler
		
		init(
			persistenceHandler: BYPersistenceHandler = BYPersistenceHandler()
		) {
			self.persistenceHandler = persistenceHandler
			loadSavedHabitsOrDefault()
		}
		
		// MARK: - Habit Properties
		@Published
		private(set) var dailyHabits = [HabitItem]() {
			didSet {
				persistenceHandler.daily.encodeAndSave(dailyHabits)
			}
		}
		
		@Published
		private(set) var weeklyHabits = [HabitItem]() {
			didSet {
				persistenceHandler.weekly.encodeAndSave(weeklyHabits)
			}
		}
		
		@Published
		private(set) var biweeklyHabits = [HabitItem]() {
			didSet {
				persistenceHandler.biweekly.encodeAndSave(biweeklyHabits)
			}
		}
		
		@Published
		private(set) var monthlyHabits = [HabitItem]() {
			didSet {
				persistenceHandler.monthly.encodeAndSave(monthlyHabits)
			}
		}
		
		// MARK: - Other Properties
		var isShowingAddHabitView = false
		
		// MARK: - Methods
		
		private func loadSavedHabitsOrDefault() {
			dailyHabits = persistenceHandler.daily.decodeAndReturnSavedDataOrNil(
				type: [HabitItem].self
			) ?? []
			
			weeklyHabits = persistenceHandler.weekly.decodeAndReturnSavedDataOrNil(
				type: [HabitItem].self
			) ?? []
			
			biweeklyHabits = persistenceHandler.biweekly.decodeAndReturnSavedDataOrNil(
				type: [HabitItem].self
			) ?? []
			
			monthlyHabits = persistenceHandler.monthly.decodeAndReturnSavedDataOrNil(
				type: [HabitItem].self
			) ?? []
		}
		
		func addHabit(
			name: inout String,
			type: HabitType,
			completedTimes: Int,
			notes: String
		) -> Void {
			assignDefaultHabitName(to: &name)
			let moddedCompletedTimes = handleCompletedTimesOrDefault(completedTimes)
			
			let newItem = HabitItem(
				name: name,
				type: type,
				completedTimes: moddedCompletedTimes,
				notes: notes
			)
			addHabit(newItem)
		}
		
		private func addHabit(_ newItem: HabitItem) -> Void {
			switch newItem.type {
				case .daily:
					dailyHabits.append(newItem)
				case .weekly:
					weeklyHabits.append(newItem)
				case .biweekly:
					biweeklyHabits.append(newItem)
				case .monthly:
					monthlyHabits.append(newItem)
			}
		}
		
		fileprivate func assignDefaultHabitName(to name: inout String) -> Void {
			if name == "" { name = "Untitled Habit" }
		}
		
		fileprivate func handleCompletedTimesOrDefault(_ amount: Int) -> Int {
			return amount < 0 ? 0 : amount
		}
		
		func deleteDailyHabits(at offsets: IndexSet) -> Void {
			dailyHabits.remove(atOffsets: offsets)
		}
		
		func deleteWeeklyHabits(at offsets: IndexSet) -> Void {
			weeklyHabits.remove(atOffsets: offsets)
		}
		
		func deleteBiweeklyHabits(at offsets: IndexSet) -> Void {
			biweeklyHabits.remove(atOffsets: offsets)
		}
		
		func deleteMonthlyHabits(at offsets: IndexSet) -> Void {
			monthlyHabits.remove(atOffsets: offsets)
		}
	}
}
