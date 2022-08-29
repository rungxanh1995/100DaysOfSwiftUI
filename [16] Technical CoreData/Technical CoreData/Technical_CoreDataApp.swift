//
//  Technical_CoreDataApp.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-26.
//

import SwiftUI

@main
struct Technical_CoreDataApp: App {
	@StateObject
	private var dataController = DataController()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
		}
	}
}
