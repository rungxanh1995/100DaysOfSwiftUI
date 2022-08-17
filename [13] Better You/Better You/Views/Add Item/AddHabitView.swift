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
							Constants.ForHabit.allategories,
							id: \.self
						) { category in
							Text(category.rawValue)
						}
					}
					
					DatePicker(
						"Date Started",
						selection: $viewModel.startDate,
						in: Constants.ForHabit.dateRangeUntilToday,
						displayedComponents: .date
					)
					
					HStack {
						Text("Completed Times:")
						Stepper(
							"\(viewModel.habitCompletedTimes)",
							value: $viewModel.habitCompletedTimes,
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
							text: $viewModel.habitNotes,
							prompt: Text("Add extra notes..."),
							axis: .vertical
						)
					} else {
						// Fallback on earlier versions
						TextField(
							"Notes",
							text: $viewModel.habitNotes,
							prompt: Text("Add extra notes...")
						)
					}
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
			startDate: viewModel.startDate,
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
