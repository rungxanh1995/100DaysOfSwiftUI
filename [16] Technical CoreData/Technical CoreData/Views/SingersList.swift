//
//  SingersList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import SwiftUI

/// This view was used to teach
/// how to filter a fetch results with predicates
struct SingersList: View {
	@Environment(\.managedObjectContext)
	var managedObjectContext
	
	@State
	private var lastNameFilter: String = "A"
	
    var body: some View {
		VStack {
			// list of matching singers
			FilteredList(
				filterKey: "lastName",
				filterValue: lastNameFilter,
				predicateType: .beginsWith
			) { (singer: Singer) in
				Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
			}
			
			HStack {
				Button("Add Examples") {
					addExamples()
				}
				
				Spacer()
				
				Button("Show A") {
					lastNameFilter = "A"
				}
				
				Spacer()
				
				Button("Show S") {
					lastNameFilter = "S"
				}
			}
			.padding()
		}
    }
}

private extension SingersList {
	func addExamples() -> Void {
		let taylor = Singer(context: managedObjectContext)
		taylor.firstName = "Taylor"
		taylor.lastName = "Swift"
		
		let ed = Singer(context: managedObjectContext)
		ed.firstName = "Ed"
		ed.lastName = "Sheeran"
		
		let adele = Singer(context: managedObjectContext)
		adele.firstName = "Adele"
		adele.lastName = "Adkins"
		
		try? managedObjectContext.save()
	}
}

#if DEBUG
struct SingersList_Previews: PreviewProvider {
    static var previews: some View {
        SingersList()
    }
}
#endif
