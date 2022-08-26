//
//  DetailView.swift
//  Bookworm
//
//  Created by Joe Pham on 2022-08-22.
//

import CoreData
import SwiftUI

struct DetailView: View {
	
	@ObservedObject
	var viewModel: DetailView.ViewModel
	
    var body: some View {
		DetailView.ViewMode(viewModel: viewModel)
    }
}
