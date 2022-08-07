//
//  ExpenseListCell.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import SwiftUI

struct ExpenseListCell: View {
	
	let expenseItem: ExpenseItem
	
	@ObservedObject
	var viewModel: ExpenseListCellViewModel
	
	var body: some View {
		HStack(alignment: .top) {
			VStack(alignment: .leading) {
				Text(expenseItem.name)
					.font(.system(.headline, design: .rounded))
				
				if viewModel.itemHasNotes {
					Text(expenseItem.notes)
						.font(.system(.caption2, design: .rounded))
						.foregroundColor(.secondary)
						.fixedSize(horizontal: false, vertical: true)
				}
			}
			
			Spacer()
			
			Text(
				expenseItem.amount,
				format: .currency(code: expenseItem.currency.rawValue)
			)
			.font(.system(.callout, design: .monospaced).bold())
			.foregroundColor(viewModel.colorForAmount)
		}
	}
}

struct ExpenseListCell_Previews: PreviewProvider {
	static var previews: some View {
		let sampleItem = ExpenseItem(
			name: "Breakfast",
			type: ExpenseType.personal,
			amount: 10.99,
			currency: .CAD,
			notes: ""
		)
		ExpenseListCell(
			expenseItem: sampleItem,
			viewModel: ExpenseListCellViewModel(
				item: sampleItem
			)
		)
	}
}
