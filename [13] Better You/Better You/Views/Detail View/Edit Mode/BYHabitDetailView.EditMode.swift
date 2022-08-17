//
//  BYHabitDetailView.EditMode.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-16.
//

import SwiftUI

extension BYHabitDetailView {
	struct EditMode: View {
		@Environment(\.dismiss) var dismissThisView
		
		@ObservedObject
		var viewModel: BYHabitDetailView.ViewModel
		
		var body: some View {
			// TODO: Refactor into separate edit view
			NavigationView {
				Form {
					Section(
						header: Text("General")
					) {
						TextField(
							"Name",
							text: $viewModel.item.name
						)
						
						DatePicker(
							"Date Started",
							selection: $viewModel.item.startDate,
							in: Constants.ForHabit.dateRangeUntilToday,
							displayedComponents: .date
						)
						
						HStack {
							Text("Completed Times:")
							Stepper(
								"\(viewModel.item.completedTimes)",
								value: $viewModel.item.completedTimes,
								in: Constants.ForHabit.reasonableCompletedTimes
							)
						}
					}
					
					Section(
						header: Text("Notes")
					) {
						if #available(iOS 16.0, *) {
							TextField(
								"Notes",
								text: $viewModel.item.notes,
								prompt: Text("Add extra notes..."),
								axis: .vertical
							)
						} else {
							// Fallback on earlier versions
							TextField(
								"Notes",
								text: $viewModel.item.notes,
								prompt: Text("Add extra notes")
							)
						}
					}
				}
				
				.navigationTitle("Edit Habit")
				.toolbar {
					Button("Done") {
						// TODO: Edit habit item, then dismiss view
						viewModel.updateHabitItemInItsSource()
						dismissThisView()
					}
				}
			}
		}
	}
}
