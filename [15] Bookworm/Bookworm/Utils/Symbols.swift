//
//  Symbols.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-24.
//

import SwiftUI

enum Symbols {
	static let starFilled: Image = .init(systemName: "star.fill")
	static let trash: Image = .init(systemName: "trash")
	static let pencil: Image = .init(systemName: "pencil")
	static let house: Image = .init(systemName: "house.fill").symbolRenderingMode(.hierarchical)
	static let gear: Image = .init(systemName: "gearshape.fill").symbolRenderingMode(.hierarchical)
	static let link: Image = .init(systemName: "link.circle").symbolRenderingMode(.hierarchical)
}
