//
//  HomeViewModel.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import Foundation

extension HomeView {
	
	/// Plays as the main manager for all types of habits.
	/// I know it's violating SRP and a bit lengthy at the moment.
	///
	/// I attempted to refactor all habits to a separate class with designated code
	/// to handle persistence, yet a bug caused the habits to be overwritten
	/// when saved into `UserDefaults`.
	///
	/// I'd be happy to come back and refactor again anytime I could
	/// figure out a solution.
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
			
			monthlyHabits = persistenceHandler.monthly.decodeAndReturnSavedDataOrNil(
				type: [HabitItem].self
			) ?? []
		}
		
		// MARK: - CRUD Operations
		
		func addHabit(
			name: inout String,
			category: HabitItem.Category,
			startDate: Date,
			completedTimes: Int,
			notes: String
		) -> Void {
			assignDefaultHabitName(to: &name)
			let moddedCompletedTimes = handleCompletedTimesOrDefault(completedTimes)
			
			let newItem = HabitItem(
				name: name,
				category: category,
				startDate: startDate,
				completedTimes: moddedCompletedTimes,
				notes: notes
			)
			addHabit(newItem)
		}
		
		private func addHabit(_ newItem: HabitItem) -> Void {
			switch newItem.category {
				case .daily:
					dailyHabits.append(newItem)
				case .weekly:
					weeklyHabits.append(newItem)
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
		
		func updateHabits(with item: HabitItem) -> Void {
			guard let index = getIndex(of: item) else { return }
			
			switch item.category {
				case .daily: dailyHabits[index] = item
				case .weekly: weeklyHabits[index] = item
				case .monthly: monthlyHabits[index] = item
			}
		}
		
		private func getIndex(of item: HabitItem) -> Int? {
			switch item.category {
				case .daily:
					return dailyHabits.firstIndex { $0.id == item.id }
				case .weekly:
					return weeklyHabits.firstIndex { $0.id == item.id }
				case .monthly:
					return monthlyHabits.firstIndex { $0.id == item.id }
			}
		}
		
		func deleteDailyHabits(at offsets: IndexSet) -> Void {
			dailyHabits.remove(atOffsets: offsets)
		}
		
		func deleteWeeklyHabits(at offsets: IndexSet) -> Void {
			weeklyHabits.remove(atOffsets: offsets)
		}
		
		func deleteMonthlyHabits(at offsets: IndexSet) -> Void {
			monthlyHabits.remove(atOffsets: offsets)
		}
	}
}
