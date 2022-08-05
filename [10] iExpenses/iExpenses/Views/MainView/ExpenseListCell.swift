//
//  ExpenseListCell.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import SwiftUI

struct ExpenseListCell: View {
	
	let expenseItem: ExpenseItem
	
	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(expenseItem.name)
					.font(.headline)
				Text(expenseItem.type)
					.font(.caption2)
			}
			
			Spacer()
			
			Text(
				expenseItem.amount,
				format: .currency(code: Locale.current.currencyCode ?? "USD")
			)
				.font(.caption)
				.foregroundColor(.secondary)
		}
	}
}

struct ExpenseListCell_Previews: PreviewProvider {
	static var previews: some View {
		ExpenseListCell(
			expenseItem: ExpenseItem(name: "Breakfast", type: "Personal", amount: 5.49)
		)
	}
}
