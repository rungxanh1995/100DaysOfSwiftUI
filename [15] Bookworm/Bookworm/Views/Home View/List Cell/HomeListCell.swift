//
//  HomeListCell.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import SwiftUI

struct HomeListCell: View {
	let book: Book
	
    var body: some View {
		HStack(alignment: .top) {
			EmojiRatingView(rating: book.rating)
				.font(.title)
			
			VStack(alignment: .leading) {
				Text(book.title ?? "Unknown Title")
					.font(.headline)
				Text(book.author ?? "Unknown Author")
					.font(.caption)
					.foregroundColor(.secondary)
			}
			
			Spacer()
			
			VStack(alignment: .trailing) {
				Text(book.genre ?? "Unknown Genre")
					.font(.caption)
					.foregroundColor(.secondary)
			}
		}
    }
}

struct HomeListCell_Previews: PreviewProvider {
	static let context = StorageProviderImpl.standard.context
    
	static var previews: some View {
		let book = Book(context: context)
		book.title = "Test book"
		book.author = "Test author"
		book.genre = "Programming"
		book.rating = 4
		book.review = "This was a great book; I really enjoyed it."
        return HomeListCell(book: book)
    }
}
