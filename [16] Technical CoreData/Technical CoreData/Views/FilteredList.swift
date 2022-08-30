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
///
/// - Parameters:
/// 	- `filterKey`: The entity's attribute name to filter, of type `String`
/// 	- `filterValue`: The value to filter with, of type `String`
/// 	- `content`: The `View` content to display, passed in as closure
struct FilteredList<T: NSManagedObject, Content: View>: View {
	
	@FetchRequest
	private var fetchRequest: FetchedResults<T>
	/// The UI layout of this `FilteredList`,
	/// which should be decided by its parent view
	private let content: (T) -> Content
	
	init(
		filterKey: String,
		filterValue: String,
		predicateType: Predicates.Types,
		@ViewBuilder content: @escaping (T) -> Content
	) {
		let predicate: _ = Predicates.generate(for: predicateType, key: filterKey, value: filterValue)
		_fetchRequest = FetchRequest<T>(
			sortDescriptors: [],
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
