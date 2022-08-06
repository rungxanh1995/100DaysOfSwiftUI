//
//  ExpenseCurrency.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-05.
//

import Foundation

enum ExpenseCurrency: String, Codable, CaseIterable {
	case AUD = "Australian Dollar"
	case CAD = "Canadian Dollar"
	case CHF = "Swiss Franc"
	case EUR = "Euro"
	case GBP = "British Pound"
	case USD = "US Dollar"
	case VND = "Vietnam Dong"
}
