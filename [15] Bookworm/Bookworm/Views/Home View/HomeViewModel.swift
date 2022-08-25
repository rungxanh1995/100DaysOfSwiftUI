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
			DispatchQueue.main.async { [unowned self] in
				savedBooks = storageProvider.fetch()
			}
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
