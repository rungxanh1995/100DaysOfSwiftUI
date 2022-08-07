//
//  AddExpenseViewModel.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import Foundation

/// Handles hosting data during the creation of a new expense,
/// used with a `@StateObject` property wrapper.
///
/// The "heavy lifting" operations (i.e. actually adding an `ExpenseItem` to an array)
/// is done by `ExpenseListViewModel` instead, using `@ObservedObject`
final class AddExpenseViewModel: ObservableObject {
	
	private let listViewModel: ExpenseListViewModel
	
	init(parentVM: ExpenseListViewModel) {
		self.listViewModel = parentVM
	}
	
	@Published
	var expenseName: String = ""
	
	@Published
	var expenseType: ExpenseType = ExpenseType.personal
	
	@Published
	var expenseAmount: String = ""
	
	@Published
	var expenseCurrency: ExpenseCurrency = .CAD
	
	@Published
	var expenseNotes: String = ""
	
	let expenseTypes: [ExpenseType] = ExpenseType.allCases
	let expenseCurrencies: [ExpenseCurrency] = ExpenseCurrency.allCases
	
	func addExpense(
		name: inout String, type: ExpenseType, amount: String, currency: ExpenseCurrency, notes: String
	) -> Void {
		listViewModel.addExpense(name: &name, type: type, amount: amount, currency: currency, notes: notes)
	}
}
