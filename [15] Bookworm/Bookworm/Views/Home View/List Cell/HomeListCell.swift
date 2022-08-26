//
//  HomeListCell.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import SwiftUI

struct HomeListCell: View {
	/// Marked `@ObservedObject` to re-render
	/// upon change from parent view.
	///
	/// Link for more info: https://www.hackingwithswift.com/forums/swiftui/list-fails-to-update-when-detail-saved-core-data/4523/4526
	@ObservedObject
	var book: Book
	
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
				HStack(spacing: 3) {
					Text("\(book.rating)")
						.font(.headline)
					Symbols.starFilled
						.font(.caption)	// as SF Symbol is a tad big
				}
				.foregroundColor(colorForRating())
				
				Text(book.genre ?? "Unknown Genre")
					.font(.caption)
					.foregroundColor(.secondary)
			}
		}
	}
	
	private func colorForRating() -> Color {
		switch book.rating {
			case 1: return .red
			case 2, 3: return .yellow
			default: return .teal
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
