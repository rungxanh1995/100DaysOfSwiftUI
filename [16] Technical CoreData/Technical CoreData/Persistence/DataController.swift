//
//  DataController.swift
//  Bookworm
//
//  Created by Paul Hudson on 23/11/2021.
//

import CoreData

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Technical CoreData")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
			
			// Merge objects with the same constraints into one
			// and save into Core Data underlying database
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
