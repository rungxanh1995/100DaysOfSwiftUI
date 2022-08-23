//
//  AddBookView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData
import SwiftUI

struct AddBookView: View {
	@Environment(\.managedObjectContext)
	var context
	
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String = ""
	@State private var author: String = ""
	@State private var rating: Int = 3
	@State private var genre: String = ""
	@State private var review: String = ""
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section {
					TextEditor(text: $review)
					RatingView(rating: $rating)
				} header: {
					Text("Write a review")
				}
				
				Section {
					Button("Save") {
						let newBook = Book(context: context)
						newBook.id = UUID()
						newBook.title = title
						newBook.author = author
						newBook.rating = Int16(rating)
						newBook.genre = genre
						newBook.review = review
						
						try? context.save()
						dismiss()
					}
				}
			}
			.navigationTitle("Add Book")
		}
    }
}

struct AddBookView_Previews: PreviewProvider {
	static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
	
    static var previews: some View {
        AddBookView()
    }
}
