//
//  DetailView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData
import SwiftUI

struct DetailView: View {
	
	@Environment(\.dismiss)
	private var dismiss
	
	@ObservedObject
	var viewModel: DetailView.ViewModel
	
	@State
	private var showingDeleteAlert: Bool = false
	
    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				Image(viewModel.book.genre ?? "Fantasy")
					.resizable()
					.scaledToFit()
					.cornerRadius(10)
				
				ImageWatermark(
					text: Text(viewModel.book.genre?.uppercased() ?? "FANTASY")
				)
			}
			.padding()
			
			Text(viewModel.book.author ?? "Unknown author")
				.font(.title)
				.foregroundColor(.secondary)
			
			if viewModel.bookContainsReview {
				Text(viewModel.book.review ?? "No review")
					.padding()
			}
			
			RatingView(rating: .constant(Int(viewModel.book.rating)))
				.font(.largeTitle)
		}
		.navigationTitle(viewModel.book.title ?? "Unknown Book")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {
				showingDeleteAlert = true
			} label: {
				Label("Delete this book", systemImage: "trash")
			}
			.confirmationDialog(
				"Are you sure?",
				isPresented: $showingDeleteAlert,
				titleVisibility: .visible
			) {
				Button("Delete Book", role: .destructive) {
					viewModel.deleteBook()
					dismiss()
				}
			} message: {
				Text("You cannot undo this action")
			}
		}
    }
}
