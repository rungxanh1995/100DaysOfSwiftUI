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
		
		init(storageProvider: StorageProvider = .standard) {
			self.storageProvider = storageProvider
			fetchBooks()
		}
		
		func fetchBooks() -> Void {
			let bookRequest = NSFetchRequest<Book>(entityName: "Book")
			savedBooks = loadBooksAndHandleError(from: bookRequest)
		}
		
		fileprivate func loadBooksAndHandleError(from request: NSFetchRequest<Book>) -> [Book] {
			do {
				let context: NSManagedObjectContext = storageProvider.container.viewContext
				return try context.fetch(request)
			} catch let error {
				print("Error fetching books. \(error.localizedDescription)")
				return [Book]()
			}
		}
		
		func addBook(_ title: String, author: String, rating: Int, genre: String, review: String) -> Void {
			let context = storageProvider.container.viewContext
			
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
			
			let context = storageProvider.container.viewContext
			context.delete(book)
			
			saveThenRefetchData()
		}
		
		private func saveThenRefetchData() -> Void {
			do {
				try storageProvider.container.viewContext.save()
				fetchBooks()
			} catch let error {
				print("Error saving data. \(error.localizedDescription)")
			}
		}
	}
}
