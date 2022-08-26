//
//  StorageProvider.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData

protocol StorageProvider {
	var context: NSManagedObjectContext { get }
	func fetch<T>() -> T
	func saveAndHandleError() -> Void
}

/// Implementation of a `StorageProvider` for a desired Core Data entity
final class StorageProviderImpl: StorageProvider {
	
	/// Singleton instance to use in the app
	static let standard: StorageProviderImpl = .init()
	
	private let container: NSPersistentContainer
	let context: NSManagedObjectContext
	
	private init() {
		container = .init(name: "Bookworm")
		container.loadPersistentStores { (_, error) in
			if let error = error {
				fatalError("Core Data failed to load: \(error.localizedDescription)")
			}
		}
		context = container.viewContext
	}
	
	func fetch<T>() -> T {
		let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
		// Sort fetch results by title, then author
		fetchRequest.sortDescriptors = [
			NSSortDescriptor(keyPath: \Book.title, ascending: true),
			NSSortDescriptor(keyPath: \Book.author, ascending: true)
		]
		return loadBooksAndHandleError(from: fetchRequest) as! T
	}
	
	fileprivate func loadBooksAndHandleError(from request: NSFetchRequest<Book>) -> [Book] {
		do {
			let context: NSManagedObjectContext = container.viewContext
			return try context.fetch(request)
		} catch let error {
			print("Error fetching books. \(error.localizedDescription)")
			return [Book]()
		}
	}
	
	func saveAndHandleError() -> Void {
		do {
			try container.viewContext.save()
		} catch let error {
			print("Error saving data. \(error.localizedDescription)")
		}
	}
}
