//
//  DetailView.EditMode.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import SwiftUI

extension DetailView {
	struct EditMode: View {
		@Environment(\.dismiss) var dismiss
		
		@ObservedObject
		var viewModel: DetailView.ViewModel
		
		var body: some View {
			NavigationView {
				Form {
					Section {
						TextField(
							"Name of Book",
							text: $viewModel.newBookTitle
						)
						
						TextField(
							"Name of Author",
							text: $viewModel.newBookAuthor
						)
						
						Picker("Select Genre", selection: $viewModel.newBookGenre) {
							ForEach(Constants.bookGenresSorted, id: \.self) {
								Text($0)
							}
						}
					}
					
					Section(
						header: Text("Book Review")
					) {
						TextEditor(text: $viewModel.newBookReview)
						RatingView(rating: $viewModel.newBookRating)
					}
				}
				.navigationTitle("Edit Book")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						Button("Cancel") {
							dismiss()
						}
					}
					
					ToolbarItem(placement: .navigationBarTrailing) {
						Button("Done") {
							didTapDoneButton()
						}
						.font(.headline)
					}
				}
			}
		}
		
		private func didTapDoneButton() -> Void {
			viewModel.updateBook()
			haptic(.success)
			dismiss()
		}
	}
}

