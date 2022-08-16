//
//  BYHabitDetailView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import SwiftUI

struct BYHabitDetailView: View {
	
	@ObservedObject
	var viewModel: Self.ViewModel
	
    var body: some View {
		Self.ViewMode(viewModel: viewModel)
    }
}

struct BYHabitDetailCell: View {
	let title: String
	let caption: LocalizedStringKey
	
	var body: some View {
		VStack {
			Text(title)
				.font(.system(.title3, design: .rounded).bold())
				.padding(.bottom)
			
			Text(caption)
				.font(.system(.caption2, design: .rounded))
		}
		.padding()
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.regularMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 12))
		.overlay(
			RoundedRectangle(cornerRadius: 12)
				.stroke(.quaternary)
		)
	}
}

struct BYHabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
		let sampleItem = HabitItem(
			name: "Work Out 🏋🏻‍♂️",
			category: .daily,
			startDate: Date(),
			completedTimes: 17,
			notes: "At school gymnasium"
		)
		BYHabitDetailView(viewModel: .init(item: sampleItem))
    }
}
