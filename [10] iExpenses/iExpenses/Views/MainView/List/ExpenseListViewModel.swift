//
//  ExpenseViewModels.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import Foundation

final class ExpenseListViewModel: ObservableObject {
	
	private let personalPersistence = PersistenceManager(/* for: */ expenseType: .personal)
	private let businessPersistence = PersistenceManager(/* for: */ expenseType: .business)
	
	@Published
	private(set) var personalExpenseItems: [ExpenseItem] = [] {
		didSet {
			personalPersistence.encodeAndSave(personalExpenseItems)
		}
	}
	
	@Published
	private(set) var businessExpenseItems: [ExpenseItem] = [] {
		didSet {
			businessPersistence.encodeAndSave(businessExpenseItems)
		}
	}
	
	var isShowingAddExpenseView = false
	
	init() {
		loadSavedExpensesOrDefault()
	}
	
	fileprivate func loadSavedExpensesOrDefault() {
		
		personalExpenseItems = personalPersistence
			.decodeAndReturnSavedDataOrNil(type: [ExpenseItem].self) ?? []
		
		businessExpenseItems = businessPersistence
			.decodeAndReturnSavedDataOrNil(type: [ExpenseItem].self) ?? []
	}
	
	func addExpense(_ newItem: ExpenseItem) -> Void {
		switch newItem.type {
			case .personal:
				personalExpenseItems.append(newItem)
			case .business:
				businessExpenseItems.append(newItem)
			default:
				// TODO: Handle more expense types here
				break
		}
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
	
	func deletePersonalExpenses(at offsets: IndexSet) -> Void {
		personalExpenseItems.remove(atOffsets: offsets)
	}
	
	func deleteBusinessExpenses(at offsets: IndexSet) -> Void {
		businessExpenseItems.remove(atOffsets: offsets)
	}
}
