//
//  DetailView.ViewMode.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-25.
//

import SwiftUI

extension DetailView {
	
	struct ViewMode: View {
		
		@ObservedObject
		var viewModel: DetailView.ViewModel
		
		@Environment(\.dismiss)
		private var dismiss
		
		@State
		private var showingDeleteAlert: Bool = false
		
		@State
		private var isShowingEdit: Bool = false
		
		var body: some View {
				ScrollView {
					decorativeImage
						.padding([.leading, .top, .trailing])
					
					bookDetails
						.frame(maxWidth: .infinity)
						.background(.regularMaterial)
						.cornerRadius(10)
						.padding()
				}
				.navigationTitle(viewModel.book.title ?? "Unknown Book")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .primaryAction) {
						editBookButton
					}
					
					ToolbarItem(placement: .destructiveAction) {
						deleteBookButton
					}
				}
		}
	}
}

extension DetailView.ViewMode {
	@ViewBuilder
	var decorativeImage: some View {
		ZStack(alignment: .bottomTrailing) {
			Image(viewModel.book.genre ?? "Fantasy")
				.resizable()
				.scaledToFit()
				.cornerRadius(10)
			
			ImageWatermark(
				text: Text(viewModel.book.genre?.uppercased() ?? "FANTASY")
			)
		}
	}
	
	@ViewBuilder
	var bookDetails: some View {
		VStack() {
			VStack(spacing: 0) {
				Text(viewModel.book.title ?? "Unknown Book")
					.font(.system(.title, design: .serif))
					.multilineTextAlignment(.center)
				
				Text("by \(viewModel.book.author ?? "Unknown author")")
			}
			.padding()
			
			if viewModel.bookContainsReview {
				Text(viewModel.book.review ?? "No review")
					.font(.system(.callout, design: .serif).italic())
					.frame(maxWidth: .infinity)
					.padding()
			}
			
			Divider()
			
			VStack {
				if let addedDate = viewModel.bookAddedDate {
					Text("Added \(addedDate)")
						.font(.caption)
				}
				
				HStack {
					Text("You rated it")
					RatingView(rating: .constant(Int(viewModel.book.rating)))
				}
				.font(.caption)
			}
			.foregroundColor(.secondary)
			.padding(.bottom)
		}
	}
	
	@ViewBuilder
	private var deleteBookButton: some View {
		Button {
			showingDeleteAlert.toggle()
		} label: {
			Symbols.trash
				.accessibilityLabel("Delete this book")
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
	
	@ViewBuilder
	private var editBookButton: some View {
		Button {
			isShowingEdit.toggle()
		} label: {
			Symbols.pencil
				.accessibilityLabel("Edit this book")
		}
		.sheet(isPresented: $isShowingEdit) {
			DetailView.EditMode(viewModel: viewModel)
		}
	}
}
