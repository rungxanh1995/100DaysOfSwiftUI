//
//  RPSFont.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import Foundation
import SwiftUI

struct RPSFont {
	static let LoraSmall = Font.custom("Lora-Regular", size: 18, relativeTo: .caption)
	static let Lora = Font.custom("Lora-Regular", size: 24, relativeTo: .body)
	static let LoraMedium = Font.custom("Lora-Medium", size: 24, relativeTo: .body)
	static let LoraBold = Font.custom("Lora-Bold", size: 24, relativeTo: .body)
}
