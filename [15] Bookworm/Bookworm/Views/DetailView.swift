//
//  DetailView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData
import SwiftUI

struct DetailView: View {
	@Environment(\.managedObjectContext)
	private var context
	
	@Environment(\.dismiss)
	private var dismiss
	
	@State
	private var showingDeleteAlert: Bool = false
	
	let book: Book
	
    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				Image(book.genre ?? "Fantasy")
					.resizable()
					.scaledToFit()
				
				Text(book.genre?.uppercased() ?? "FANTASY")
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundColor(.white)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())
					.offset(x: -5, y: -5)
			}
			
			Text(book.author ?? "Unknown author")
				.font(.title)
				.foregroundColor(.secondary)
			
			Text(book.review ?? "No review")
				.padding()
			
			RatingView(rating: .constant(Int(book.rating)))
				.font(.largeTitle)
		}
		.navigationTitle(book.title ?? "Unknown Book")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {
				showingDeleteAlert = true
			} label: {
				Label("Delete this book", systemImage: "trash")
			}
			.confirmationDialog(
				"Are you sure?",
				isPresented: $showingDeleteAlert
			) {
				Button("Delete This Book", role: .destructive) {
					deleteBook()
				}
			} message: {
				Text("You cannot undo this action")
			}
		}
    }
	
	func deleteBook() {
		context.delete(book)
		try? context.save()
		dismiss()
	}
}

struct DetailView_Previews: PreviewProvider {
	static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
	
	static var previews: some View {
		let book = Book(context: moc)
		book.title = "Test book"
		book.author = "Test author"
		book.genre = "Fantasy"
		book.rating = 4
		book.review = "This was a great book; I really enjoyed it."
		
		return NavigationView {
			DetailView(book: book)
		}
	}
}
