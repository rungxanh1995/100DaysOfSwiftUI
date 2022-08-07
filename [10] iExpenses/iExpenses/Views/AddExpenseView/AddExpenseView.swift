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
	var viewModel: AddExpenseViewModel
	
	@State
	private var autosizingTextFieldHeight: CGFloat = 0
	
    var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("General")
				) {
					TextField("Name", text: $viewModel.expenseName)
					
					Picker("Type", selection: $viewModel.expenseType) {
						ForEach(viewModel.expenseTypes, id: \.self) { expenseType in
							Text(expenseType.rawValue.localized())
						}
					}
					
					HStack {
						TextField("Amount", text: $viewModel.expenseAmount)
							.keyboardType(.decimalPad)
						
						Picker("Currency", selection: $viewModel.expenseCurrency) {
							ForEach(viewModel.expenseCurrencies, id: \.self) { expenseCurrency in
								Text(expenseCurrency.rawValue)
							}
						}
						.pickerStyle(.menu)
						.labelsHidden()
					}
				}
				
				Section(
					header: Text("Notes")
				) {
					let maxHeightOrDefault =
					(autosizingTextFieldHeight <= AutosizingTextField.fixedHeight) ?
					autosizingTextFieldHeight : AutosizingTextField.fixedHeight
					
					AutosizingTextField(
						text: $viewModel.expenseNotes,
						hint: "Any extra notes...".localized(),
						containerHeight: $autosizingTextFieldHeight
					)
					.frame(height: maxHeightOrDefault)
				}
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
		
		viewModel.addExpense(
			name: &viewModel.expenseName,
			type: viewModel.expenseType,
			amount: viewModel.expenseAmount,
			currency: viewModel.expenseCurrency,
			notes: viewModel.expenseNotes
		)
		
		dismissThisView()
	}
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
		AddExpenseView(
			viewModel: AddExpenseViewModel(
				parentVM: ExpenseListViewModel()
			)
		)
    }
}
