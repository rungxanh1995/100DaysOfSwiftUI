//
//  ShapeStyle+Ext.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

extension ShapeStyle where Self == Color {
	
	// MARK: - Custom App Colors -
	static var moonshotLightColor: Color {
		Color(.displayP3, red: 0.2, green: 0.2, blue: 0.3)
	}
	
	static var moonshotDarkColor: Color {
		Color(.displayP3, red: 0.1, green: 0.1, blue: 0.2)
	}
}
