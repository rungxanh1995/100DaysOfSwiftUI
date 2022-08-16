//
//  HomeListCell.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import SwiftUI

struct HomeListCell: View {
	let item: HabitItem
	
    var body: some View {
		HStack(alignment: .top) {
			VStack(alignment: .leading) {
				Text(item.name)
					.font(.system(.headline, design: .rounded))
				
				if item.notes != "" {
					Text(item.notes)
						.font(.system(.caption2, design: .rounded))
						.foregroundColor(.secondary)
						.fixedSize(horizontal: false, vertical: true)
				}
			}
			
			Spacer()
			
			Text("\(checkIcon) \(item.completedTimes)")
				.font(.system(.body, design: .rounded).bold())
				.foregroundColor(colorForCompletedTimes())
		}
    }
	
	@ViewBuilder
	private var checkIcon: Image {
		Image(systemName: "checkmark.circle.fill").symbolRenderingMode(.hierarchical)
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

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
		let sampleItem = HabitItem(
			name: "Work Out 🏋🏻‍♂️",
			category: .daily,
			startDate: Date(),
			completedTimes: 17,
			notes: "At school gymnasium"
		)
        HomeListCell(item: sampleItem)
    }
}
