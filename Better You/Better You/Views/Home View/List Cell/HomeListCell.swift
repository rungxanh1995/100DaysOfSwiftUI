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
			
			Text("\(item.completedTimes)")
				.font(.system(.callout, design: .monospaced).bold())
		}
    }
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
		let sampleItem = HabitItem(
			name: "Work Out 🏋🏻‍♂️",
			category: .daily,
			completedTimes: 3,
			notes: ""
		)
        HomeListCell(item: sampleItem)
    }
}
