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
		@Published var newBookTitle: String
		@Published var newBookAuthor: String
		@Published var newBookRating: Int
		@Published var newBookGenre: String
		@Published var newBookReview: String
		
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
			
			self.newBookTitle = book.title ?? ""
			self.newBookAuthor = book.author ?? ""
			self.newBookRating = Int(book.rating)
			self.newBookGenre = book.genre ?? ""
			self.newBookReview = book.review ?? ""
		}
		
		func updateBook() -> Void {
			book.title = newBookTitle
			book.author = newBookAuthor
			book.rating = Int16(newBookRating)
			book.genre = newBookGenre
			book.review = newBookReview
			saveThenRefetchData()
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
