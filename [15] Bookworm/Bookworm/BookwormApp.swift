//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-20.
//

import SwiftUI

@main
struct BookwormApp: App {
	let persistence: StorageProviderImpl = StorageProviderImpl.standard
	
    var body: some Scene {
        WindowGroup {
            HomeView()
				.environment(
					\.managedObjectContext,
					 persistence.context
				)
        }
    }
}
