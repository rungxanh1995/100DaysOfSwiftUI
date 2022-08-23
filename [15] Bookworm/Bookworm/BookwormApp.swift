//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-20.
//

import SwiftUI

@main
struct BookwormApp: App {
	let persistence: StoragePervider = StoragePervider.standard
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(
					\.managedObjectContext,
					 persistence.container.viewContext
				)
        }
    }
}
