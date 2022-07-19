//
//  RPSGameMode.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-18.
//

import Foundation

/// Regulates whether a player should play to win or to lose against
/// a randomly generated hand gesture.
enum RPSGameMode: CaseIterable {
	case playToWin, playToLose
}
