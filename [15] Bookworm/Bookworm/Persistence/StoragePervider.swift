//
//  StorageProvider.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData

final class StoragePervider {
	
	/// Singleton instance to use in the app
	static let standard: StoragePervider = .init()
	
	let container: NSPersistentContainer
	
	private init() {
		container = .init(name: "Bookworm")
		container.loadPersistentStores { (_, error) in
			if let error = error {
				fatalError("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
