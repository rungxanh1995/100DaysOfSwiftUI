//
//  ExpenseType.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-05.
//

import Foundation

enum ExpenseType: String, Codable, CaseIterable {
	case personal = "Personal"
	case business = "Business"
	case school = "School"
	case other = "Other"
}
