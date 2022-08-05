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
			List {
				ForEach(viewModel.expenseItems) { item in
					ExpenseListCell(expenseItem: item)
				}
				.onDelete(perform: viewModel.deleteExpenses)
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
				AddExpenseView(expenseListViewModel: viewModel)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
