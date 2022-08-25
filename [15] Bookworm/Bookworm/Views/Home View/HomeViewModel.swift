//
//  HomeViewModel.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-24.
//	Inspired by tutorial: https://www.youtube.com/watch?v=BPQkpxtgalY

import Foundation
import CoreData

extension HomeView {
	
	final class ViewModel: ObservableObject {
		
		@Published
		var savedBooks: [Book] = [Book]()
		
		private let storageProvider: StorageProvider
		
		init(storageProvider: StorageProvider = StorageProviderImpl.standard) {
			self.storageProvider = storageProvider
			fetchBooks()
		}
		
		func fetchBooks() -> Void {
			savedBooks = storageProvider.fetch()
		}
		
		func addBook(_ title: String, author: String, rating: Int, genre: String, review: String) -> Void {
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
		
		func deleteBook(at indexSet: IndexSet)  -> Void {
			guard let index = indexSet.first else { return }
			let book = savedBooks[index]
			
			let context = storageProvider.context
			context.delete(book)
			
			saveThenRefetchData()
		}
		
		private func saveThenRefetchData() -> Void {
			storageProvider.saveAndHandleError()
			fetchBooks()
		}
	}
}
