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
					TextField("Name of book", text: $viewModel.title)
					TextField("Author's name", text: $viewModel.author)
					
					Picker("Genre", selection: $viewModel.genre) {
						ForEach(viewModel.genres, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section {
					TextEditor(text: $viewModel.review)
					RatingView(rating: $viewModel.rating)
				} header: {
					Text("Write a review")
				}
				
				Section {
					Button("Save") {
						viewModel.addBook()
						dismiss()
					}
					.font(.headline)
					.disabled(viewModel.invalidNecessaryInputs)
				}
			}
			.navigationTitle("Add Book")
		}
    }
}
