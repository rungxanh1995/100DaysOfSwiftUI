//
//  AddHabitView.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-15.
//

import SwiftUI

struct AddHabitView: View {
	@Environment(\.dismiss) var dismissThisView
	
	@ObservedObject
	var viewModel: Self.ViewModel
	
    var body: some View {
		NavigationView {
			Form {
				Section(
					header: Text("General")
				) {
					TextField(
						"Name",
						text: $viewModel.habitName
					)
					
					Picker(
						"Type",
						selection: $viewModel.habitCategory
					) {
						ForEach(
							viewModel.habitCategories,
							id: \.self
						) { category in
							Text(category.rawValue)
						}
					}
					
					HStack {
						Text("Completed Times:")
						Stepper(
							"\(viewModel.habitCompletedTimes)",
							value: $viewModel.habitCompletedTimes,
							in: viewModel.reasonableCompletedTimes
						)
					}
				}
				
				Section(
					header: Text("Notes")
				) {
					TextField(
						"Notes",
						text: $viewModel.habitNotes,
						prompt: Text("Add extra notes..."),
						axis: .vertical
					)
				}
			}
			.navigationTitle("Add Habit")
			.toolbar {
				Button(action: addNewHabitThenDismissView) {
					Image(systemName: "checkmark")
				}
				.buttonStyle(.bordered)
			}
		}
    }
}

extension AddHabitView {
	private func addNewHabitThenDismissView() -> Void {
		
		viewModel.addHabit(
			name: &viewModel.habitName,
			category: viewModel.habitCategory,
			completedTimes: viewModel.habitCompletedTimes,
			notes: viewModel.habitNotes
		)
		
		dismissThisView()
	}
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
		AddHabitView(viewModel: .init(parentVM: HomeView.ViewModel()))
    }
}
