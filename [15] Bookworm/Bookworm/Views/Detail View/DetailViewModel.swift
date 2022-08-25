//
//  DetailViewModel.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import Foundation

extension DetailView {
	
	final class ViewModel: ObservableObject {
		let book: Book
		var bookContainsReview: Bool {
			!(book.review?.isEmpty ?? true)
		}
		var bookAddedDate: String? {
			book.addedDate?.formatted(date: .abbreviated, time: .shortened)
		}
		
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
