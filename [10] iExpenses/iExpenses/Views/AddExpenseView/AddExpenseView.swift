//
//  AddExpenseView.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import SwiftUI

struct AddExpenseView: View {
	@Environment(\.dismiss) var dismissThisView
	
	@ObservedObject
	var expenseListViewModel: ExpenseListViewModel
	
	@StateObject
	var viewModel = AddExpenseViewModel()
	
    var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $viewModel.expenseName)
				
				Picker("Type", selection: $viewModel.expenseType) {
					ForEach(viewModel.expenseTypes, id: \.self) { expenseType in
						Text(expenseType.rawValue)
					}
				}
				
				TextField("Amount", text: $viewModel.expenseAmount)
					.keyboardType(.decimalPad)
			}
			.navigationTitle("Add Expense")
			.toolbar {
				Button(action: addNewExpenseAndDismissView) {
					Image(systemName: "checkmark")
				}
				.buttonStyle(.bordered)
			}
		}
    }
	
	func addNewExpenseAndDismissView() -> Void {
		
		expenseListViewModel.addExpense(
			name: &viewModel.expenseName,
			type: viewModel.expenseType,
			amount: viewModel.expenseAmount
		)
		
		dismissThisView()
	}
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenseListViewModel: ExpenseListViewModel())
    }
}
