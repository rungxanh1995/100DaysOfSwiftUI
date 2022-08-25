//
//  AddBookViewModel.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import Foundation

extension AddBookView {
	
	final class ViewModel: ObservableObject {
		@Published var title: String = ""
		@Published var author: String = ""
		@Published var rating: Int = 3
		@Published var genre: String = "Fantasy"
		@Published var review: String = ""
		
		let genres = [
			"Fantasy",
			"Horror",
			"Kids",
			"Mystery",
			"Poetry",
			"Romance",
			"Thriller"
		]
		
		let storageProvider: StorageProvider
		
		/// Needed to perform a refetch in `HomeView` after adding a book
		let parentVM: HomeView.ViewModel
		
		init(
			storageProvider: StorageProvider = StorageProviderImpl.standard,
			parentVM: HomeView.ViewModel
		) {
			self.storageProvider = storageProvider
			self.parentVM = parentVM
		}
		
		func addBook() -> Void {
			let context = storageProvider.context
			
			let newBook = Book(context: context)
			newBook.id = UUID()
			newBook.title = title
			newBook.author = author
			newBook.rating = Int16(rating)
			newBook.genre = genre
			newBook.review = review
			
			saveThenRefetchData()
		}
		
		private func saveThenRefetchData() -> Void {
			storageProvider.saveAndHandleError()
			parentVM.fetchBooks()
		}
	}
}
