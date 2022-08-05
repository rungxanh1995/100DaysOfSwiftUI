//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-04.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
}
