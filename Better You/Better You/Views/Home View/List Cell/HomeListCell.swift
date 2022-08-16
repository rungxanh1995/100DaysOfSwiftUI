//
//  HomeListCell.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-12.
//

import SwiftUI

struct HomeListCell: View {
	@ObservedObject
	var viewModel: Self.ViewModel
	
	var body: some View {
		HStack(alignment: .top) {
			VStack(alignment: .leading) {
				Text(viewModel.item.name)
					.font(.system(.headline, design: .rounded))
				
				if viewModel.item.notes != "" {
					Text(viewModel.item.notes)
						.font(.system(.caption2, design: .rounded))
						.foregroundColor(.secondary)
						.fixedSize(horizontal: false, vertical: true)
				}
			}
			
			Spacer()
			
			Text("\(checkIcon) \(viewModel.item.completedTimes)")
				.font(.system(.body, design: .rounded).bold())
				.foregroundColor(viewModel.colorForCompletedTimes())
		}
	}
}

private extension HomeListCell {
	
	@ViewBuilder
	var checkIcon: Image {
		Image(systemName: "checkmark.circle.fill")
			.symbolRenderingMode(.hierarchical)
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
        HomeListCell(
			viewModel: HomeListCell.ViewModel(
				item: sampleItem
			)
		)
    }
}
