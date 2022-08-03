//
//  Array+Ext.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import Foundation

extension Array {
	
	func selectFromStartTo(element specificElementIndex: Int) -> Array<Element> {
		guard !self.isEmpty else { return Array<Element>() }
		
		let cutoffSlice = self[0..<specificElementIndex]
		return Array(/* from: */ cutoffSlice)
	}
	
	func element(at index: Int) -> Element? {
		guard !self.isEmpty else { return nil }
		return self[index]
	}
}
