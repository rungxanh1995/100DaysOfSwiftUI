//
//  FilteredList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import CoreData
import SwiftUI

/// A custom view to fetch storage data of a generic entity in Core Data,
/// and requires passing a `Content` view in a closure.
struct FilteredList<T: NSManagedObject, Content: View>: View {
	
	@FetchRequest
	private var fetchRequest: FetchedResults<T>
	/// The UI layout of this `FilteredList`,
	/// which should be decided by its parent view
	private let content: (T) -> Content
	
	/// - Parameters:
	/// 	- `filterKey`: The entity's attribute name to filter, of type `String`
	/// 	- `filterValue`: The value to filter with, of type `String`
	/// 	- `predicateType`: The kind of predicate needed to filter fetched results
	/// 	- `sortDescriptors`: Sort descriptors array of a specific entity via its keypaths of attributes
	/// 	- `content`: The `View` content to display, passed in as closure
	init(
		filterKey: String,
		filterValue: String,
		predicateType: Predicates.Types,
		sortDescriptors: [SortDescriptor<T>] = [SortDescriptor<T>](),
		@ViewBuilder content: @escaping (T) -> Content
	) {
		let predicate: NSPredicate = Predicates.Factory
			.createPredicate(for: predicateType, key: filterKey, value: filterValue)
		_fetchRequest = FetchRequest<T>(
			sortDescriptors: sortDescriptors,
			predicate: predicate
		)
		self.content = content
	}
	
	var body: some View {
		List(fetchRequest, id: \.self) { eachItem in
			self.content(/* of: */ eachItem)
		}
	}
}
