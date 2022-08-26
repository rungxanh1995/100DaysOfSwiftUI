//
//  DetailViewModel.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import Foundation

extension DetailView {
	
	final class ViewModel: ObservableObject {
		var book: Book
		var bookContainsReview: Bool {
			!(book.review?.isEmpty ?? true)
		}
		var bookAddedDate: String? {
			book.addedDate?.formatted(date: .abbreviated, time: .shortened)
		}
		
		// MARK: - Edit Mode
		@Published var newBookTitle: String = ""
		@Published var newBookAuthor: String = ""
		@Published var newBookRating: Int = 3
		@Published var newBookGenre: String = "Programming"
		@Published var newBookReview: String = ""
		
		/// Needed to perform a refetch in `HomeView` after adding a book
		let parentVM: HomeView.ViewModel
		
		private let storageProvider: StorageProvider
		
		init(
			book: Book,
			parentVM: HomeView.ViewModel,
			storageProvider: StorageProvider = StorageProviderImpl.standard
		) {
			self.book = book
			self.parentVM = parentVM
			self.storageProvider = storageProvider
		}
		
		func updateBook() -> Void {
			
		}
		
		func deleteBook() -> Void {
			storageProvider.context.delete(book)
			saveThenRefetchData()
		}
		
		private func saveThenRefetchData() -> Void {
			storageProvider.saveAndHandleError()
			parentVM.fetchBooks()
		}
	}
}
