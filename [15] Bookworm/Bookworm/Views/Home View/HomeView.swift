//
//  ContentView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-20.
//

import SwiftUI

struct HomeView: View {
	@Environment(\.managedObjectContext)
	var context
	
	@FetchRequest(
		entity: Book.entity(),
		sortDescriptors: [
			NSSortDescriptor(keyPath: \Book.title, ascending: true),
			NSSortDescriptor(keyPath: \Book.author, ascending: true)
		]
	)
	var books: FetchedResults<Book>
	
	@State
	private var showingAddScreen: Bool = false
	
    var body: some View {
		NavigationView {
			List {
				ForEach(books) { book in
					NavigationLink {
						DetailView(book: book)
					} label: {
						HStack(spacing: 16) {
							EmojiRatingView(rating: book.rating)
								.font(.title)
							
							VStack(alignment: .leading) {
								Text(book.title ?? "Unknown Title")
									.font(.headline)
								Text(book.author ?? "Unknown Author")
									.font(.callout)
									.foregroundColor(.secondary)
							}
						}
					}
				}
				.onDelete(perform: deleteBooks)
			}
			.navigationTitle("Bookworm")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						showingAddScreen.toggle()
					} label: {
						Label("Add Book", systemImage: "plus")
					}
				}
				
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				}
			}
			.sheet(isPresented: $showingAddScreen) {
				AddBookView()
			}
		}
    }
	
	func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			let book = books[offset]
			context.delete(book)
		}
		
		try? context.save()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
