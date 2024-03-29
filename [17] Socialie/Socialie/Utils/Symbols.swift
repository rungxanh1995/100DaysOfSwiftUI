//
//  Symbols.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

enum Symbols {
	
	enum Images {
		static let person: Image = .init(systemName: "person.crop.circle.fill")
		static let building: Image = .init(systemName: "building.2")
		static let email: Image = .init(systemName: "envelope")
		static let map: Image = .init(systemName: "map")
		static let dotCircle: Image = .init(systemName:"circle.fill")
		static let house: Image = .init(systemName: "house.fill").symbolRenderingMode(.hierarchical)
		static let gear: Image = .init(systemName: "gearshape.fill").symbolRenderingMode(.hierarchical)
		static let link: Image = .init(systemName: "link.circle").symbolRenderingMode(.hierarchical)
		static let twitter: Image = .init("twitter").renderingMode(.original)
		static let github: Image = .init("github").renderingMode(.original)
		
		static let tools: Image = .init(systemName: "wrench.and.screwdriver.fill").symbolRenderingMode(.hierarchical)
	}
	
	enum Labels {
		static let grid: Label = .init("As Grid", systemImage: "square.grid.2x2.fill")
		static let list: Label = .init("As List", systemImage: "list.bullet")
	}
}
