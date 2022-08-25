//
//  ContentView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-20.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject
	var viewModel: HomeView.ViewModel
	
	init(viewModel: HomeView.ViewModel = .init()) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	@State
	private var showingAddScreen: Bool = false
	
    var body: some View {
		NavigationView {
			List {
				ForEach(viewModel.savedBooks) { book in
					NavigationLink {
						DetailView(viewModel: .init(book: book, parentVM: viewModel))
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
				.onDelete(perform: viewModel.deleteBook)
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
				AddBookView(
					viewModel: .init(parentVM: viewModel)
				)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
