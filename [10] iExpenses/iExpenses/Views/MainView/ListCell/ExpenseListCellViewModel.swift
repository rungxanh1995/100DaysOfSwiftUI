//
//  ExpenseListCellViewModel.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-05.
//

import SwiftUI

class ExpenseListCellViewModel: ObservableObject {
	
	private(set) var expenseItem: ExpenseItem
	
	init(item: ExpenseItem) {
		self.expenseItem = item
	}
	
	var colorForAmount: Color {
		switch expenseItem.amount {
			case 0.0..<10.0:
				return Color.teal
			case 10.0..<100.0:
				return Color.orange
			case 100.0..<Double.infinity:
				return Color.pink
			default:
				return Color.secondary
		}
	}
}
