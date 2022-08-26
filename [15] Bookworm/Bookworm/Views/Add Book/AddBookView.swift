//
//  AddBookView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData
import SwiftUI

struct AddBookView: View {
	
	@Environment(\.dismiss) var dismiss
	
	@ObservedObject
	var viewModel: AddBookView.ViewModel
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of Book", text: $viewModel.title)
					TextField("Name of Author(s)", text: $viewModel.author)
					
					Picker("Select Genre", selection: $viewModel.genre) {
						ForEach(Constants.bookGenresSorted, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section {
					TextEditor(text: $viewModel.review)
					HStack {
						Text("Tap stars to rate")
							.foregroundColor(.secondary)
						Spacer()
						RatingView(rating: $viewModel.rating)
					}
				} header: {
					Text("Write a review")
				}
			}
			.navigationTitle("Add Book")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button("Cancel") {
						dismiss()
					}
				}
				
				ToolbarItem(placement: .navigationBarTrailing) {
					Button("Add") {
						viewModel.addBook()
						haptic(.success)
						dismiss()
					}
					.font(.headline)
					.disabled(viewModel.invalidNecessaryInputs)
				}
			}
		}
    }
}
