//
//  RPSMovesStore.swift
//  Rock Paper Scissor
//
//  Created by Joe Pham on 2022-07-16.
//

import Foundation

struct RPSMovesStore {
	static let defaultStore: [RPSGameMove] = [
		Rock(),
		Paper(),
		Scissor()
	]
	
	static let movesAndTheirOpponentsToWin: [String: RPSGameMove] = [
		defaultStore.element(0).name: Paper(),
		defaultStore.element(1).name: Scissor(),
		defaultStore.element(2).name: Rock()
	]
	
	static let movesAndTheirOpponentsToLose: [String: RPSGameMove] = [
		defaultStore.element(0).name: Scissor(),
		defaultStore.element(1).name: Rock(),
		defaultStore.element(2).name: Paper()
	]
}
