//
//  ExpenseViewModels.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import Foundation

final class ExpenseListViewModel: ObservableObject {
	
	@Published
	private(set) var expenseItems: [ExpenseItem] = [] {
		didSet {
			PersistenceManager.encodeAndSave(expenseItems)
		}
	}
	
	var isShowingAddExpenseView = false
	
	init() {
		loadSavedExpensesOrDefault()
	}
	
	fileprivate func loadSavedExpensesOrDefault() {
		expenseItems = PersistenceManager
			.decodeAndReturnSavedData(
				type: [ExpenseItem].self
			) ?? []
	}
	
	func addExpense(_ newItem: ExpenseItem) -> Void {
		expenseItems.append(newItem)
	}
	
	func addExpense(name: inout String, type: ExpenseType, amount: String) -> Void {
		assignDefaultExpenseName(to: &name)
		let convertedAmount = handleExpenseAmountOrDefault(amount)
		
		let newItem = ExpenseItem(name: name, type: type, amount: convertedAmount)
		addExpense(newItem)
	}
	
	fileprivate func assignDefaultExpenseName(to name: inout String) {
		if name == "" { name = "Untitled Expense" }
	}
	
	fileprivate func handleExpenseAmountOrDefault(_ amount: String) -> Double {
		return Double(amount) ?? 0.0
	}
	
	func deleteExpenses(at offsets: IndexSet) -> Void {
		expenseItems.remove(atOffsets: offsets)
	}
}
