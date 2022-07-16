//
//  Check.swift
//  WeSplit
//
//  Created by Joe Pham on 2022-07-13.
//

import Foundation

/// Represents a real-life check, with original amount, number of people to split, and tip
struct Check {
	
	var originalAmount = 0.0
	
	var numberOfPeople = 2
	let allowedPeopleRange = 2..<20
	
	var isTipIncluded = true
	var selectedTipAmount: Double {
		isTipIncluded ? Double(selectedTipPercentage) / 100 : 0
	}
	
	var selectedTipPercentage = 10
	let tipPercentages = [10, 15, 20, 25]
	
	var totalWithTip: Double {
		originalAmount * (1 + selectedTipAmount)
	}
	
	var totalPerPerson: Double {
		totalWithTip / Double(numberOfPeople)
	}
}
