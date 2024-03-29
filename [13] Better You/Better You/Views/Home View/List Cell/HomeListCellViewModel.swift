//
//  HomeListCellViewModel.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import SwiftUI

extension HomeListCell {
	final class ViewModel: ObservableObject {
		let item: HabitItem
		
		init(item: HabitItem) {
			self.item = item
		}
		
		func colorForCompletedTimes() -> Color {
			switch item.completedTimes {
				case 0..<5: return Color.mint
				case 5..<10: return Color.orange
				case 10..<Int.max: return Color.red
				default: return Color.primary
			}
		}
	}
}
