//
//  Collection+Ext.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import Foundation

extension Collection {
	
	/// A readable extension to get an element at assigned index in the collection
	func element(_ index: Index) -> Self.Element {
		return self[index]
	}
}
