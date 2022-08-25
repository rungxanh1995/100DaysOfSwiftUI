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
			.padding(.horizontal)
			
			VStack(spacing: 20) {
				VStack(spacing: 0) {
					Text(viewModel.book.title ?? "Unknown Book")
						.font(.system(.title, design: .serif))
					
					Text("by \(viewModel.book.author ?? "Unknown author")")
				}
				.padding()
				
				
				if viewModel.bookContainsReview {
					Text(viewModel.book.review ?? "No review")
						.font(.system(.callout, design: .serif).italic())
						.frame(maxWidth: .infinity)
						.padding()
				}
				
				HStack {
					Text("You rated it")
					RatingView(rating: .constant(Int(viewModel.book.rating)))
				}
				.font(.caption)
				.padding()
			}
			.frame(maxWidth: .infinity)
			.background(.regularMaterial)
			.cornerRadius(10)
			.padding()
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
