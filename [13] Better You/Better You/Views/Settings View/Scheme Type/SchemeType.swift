//
//  SchemeType.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-24.
//

import Foundation

enum SchemeType: Int, Identifiable, CaseIterable {
	var id: Self { self }
	case system
	case light
	case dark
}

extension SchemeType {
	var title: String {
		switch self {
			case .system: return "System"
			case .light: return "Light"
			case .dark: return "Dark"
		}
	}
}
