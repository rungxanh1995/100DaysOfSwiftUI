//
//  BYHabitDetailView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import SwiftUI

struct BYHabitDetailView: View {
	let item: HabitItem
	
	let columns = [
		GridItem(.adaptive(minimum: 150, maximum: 180))
	]
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: columns) {
					Group {
						BYHabitDetailCell(
							title: item.name,
							caption: "Name"
						)
						
						
						BYHabitDetailCell(
							title: item.notes,
							caption: "Notes"
						)
						
						BYHabitDetailCell(
							title: item.category.rawValue,
							caption: "Frequency"
						)
						
						BYHabitDetailCell(
							title: item.startDate.formatted(date: .abbreviated, time: .omitted),
							caption: "Start Date"
						)
						
						BYHabitDetailCell(
							title: item.completedTimes.formatted(),
							caption: "Completed Times"
						)
					}
				}
				.padding([.horizontal, .bottom])
				
				Text("Last updated on...")
					.font(.system(.caption, design: .rounded))
			}
			.navigationTitle("Habit Detail")
		}
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
				.font(.system(.caption, design: .rounded))
		}
		.padding()
		.frame(maxWidth: .infinity, maxHeight: 200)
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
        BYHabitDetailView(item: sampleItem)
    }
}
