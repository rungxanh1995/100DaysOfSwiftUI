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
				
				Text(viewModel.book.genre?.uppercased() ?? "FANTASY")
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundColor(.white)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())
					.offset(x: -5, y: -5)
			}
			
			Text(viewModel.book.author ?? "Unknown author")
				.font(.title)
				.foregroundColor(.secondary)
			
			Text(viewModel.book.review ?? "No review")
				.padding()
			
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
				isPresented: $showingDeleteAlert
			) {
				Button("Delete This Book", role: .destructive) {
					viewModel.deleteBook()
					dismiss()
				}
			} message: {
				Text("You cannot undo this action")
			}
		}
    }
}
