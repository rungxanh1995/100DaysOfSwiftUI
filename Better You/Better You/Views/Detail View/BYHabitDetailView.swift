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

struct BYHabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
		let sampleItem = HabitItem(
			name: "Work Out 🏋🏻‍♂️",
			category: .daily,
			startDate: Date(),
			completedTimes: 17,
			notes: "At school gymnasium"
		)
		BYHabitDetailView(viewModel: .init(item: sampleItem, parentVM: .init()))
    }
}
