//
//  FilteredList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
	
	@FetchRequest
	private var fetchRequest: FetchedResults<T>
	/// The UI layout of this `FilteredList`,
	/// which should be decided by its parent view
	private let content: (T) -> Content
	
	init(
		filterKey: String,
		filterValue: String,
		@ViewBuilder content: @escaping (T) -> Content
	) {
		_fetchRequest = FetchRequest<T>(
			sortDescriptors: [],
			predicate: Predicates.beginsWith(key: filterKey, value: filterValue)
		)
		self.content = content
	}
	
	var body: some View {
		List(fetchRequest, id: \.self) { eachItem in
			self.content(/* of: */ eachItem)
		}
	}
}
