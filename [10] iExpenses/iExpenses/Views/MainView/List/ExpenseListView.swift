//
//  ExpenseListView.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-03.
//

import SwiftUI

struct ExpenseListView: View {
	
	@StateObject
	var viewModel = ExpenseListViewModel()
	
	@State
	var isShowingAddExpenseView: Bool = false
	
    var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("Personal Expenses")
				) {
					if viewModel.personalExpenseItems.isEmpty {
						emptyExpenseText
					} else {
						ForEach(viewModel.personalExpenseItems) { item in
							
							ExpenseListCell(
								expenseItem: item,
								viewModel: ExpenseListCellViewModel(item: item)
							)
						}
						.onDelete(perform: viewModel.deletePersonalExpenses)
					}
				}
				
				Section(
					header: Text("Business Expenses")
				) {
					
					if viewModel.businessExpenseItems.isEmpty {
						emptyExpenseText
					} else {
						ForEach(viewModel.businessExpenseItems) { item in
							ExpenseListCell(
								expenseItem: item,
								viewModel: ExpenseListCellViewModel(item: item)
							)
						}
						.onDelete(perform: viewModel.deleteBusinessExpenses)
					}
				}
				
				Section(
					header: Text("School Expenses")
				) {
					if viewModel.schoolExpenseItems.isEmpty {
						emptyExpenseText
					} else {
						ForEach(viewModel.schoolExpenseItems) { item in
							
							ExpenseListCell(
								expenseItem: item,
								viewModel: ExpenseListCellViewModel(item: item)
							)
						}
						.onDelete(perform: viewModel.deleteSchoolExpenses)
					}
				}
				
				Section(
					header: Text("Other Expenses")
				) {
					if viewModel.otherExpenseItems.isEmpty {
						emptyExpenseText
					} else {
						ForEach(viewModel.otherExpenseItems) { item in
							
							ExpenseListCell(
								expenseItem: item,
								viewModel: ExpenseListCellViewModel(item: item)
							)
						}
						.onDelete(perform: viewModel.deleteOtherExpenses)
					}
				}
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button {
					isShowingAddExpenseView.toggle()
				} label: {
					Image(systemName: "plus")
				}
				.buttonStyle(.bordered)
			}
			.sheet(isPresented: $isShowingAddExpenseView) {
				AddExpenseView(
					viewModel: AddExpenseViewModel(
						parentVM: viewModel
					)
				)
			}
		}
    }
}

private extension ExpenseListView {
	@ViewBuilder
	private var emptyExpenseText: some View {
		HStack {
			Spacer()
			Text("Nothing yet. Tap \(Image(systemName: "plus.rectangle.fill")) to add more")
				.font(.system(.callout, design: .rounded))
				.foregroundColor(.secondary)
			Spacer()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
