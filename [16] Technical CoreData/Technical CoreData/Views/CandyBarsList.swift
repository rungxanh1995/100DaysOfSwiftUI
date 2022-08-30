//
//  CandyBarsList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import SwiftUI

struct CandyBarsList: View {
	@Environment(\.managedObjectContext)
	var managedObjectContext
	
	@FetchRequest(sortDescriptors: [])
	var countries: FetchedResults<Country>
	
    var body: some View {
		VStack {
			List {
				ForEach(countries, id: \.self) { country in
					Section(country.wrappedFullName) {
						ForEach(country.candyArray, id: \.self) { candy in
							Text(candy.wrappedName)
						}
					}
				}
			}
			
			Button("Add") {
				addExamples()
			}
			.buttonStyle(.bordered)
			.tint(.red)
		}
		.navigationTitle("Candybars List")
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension CandyBarsList {
	func addExamples() -> Void {
		let candy1 = CandyBar(context: managedObjectContext)
		candy1.name = "Mars"
		candy1.origin = Country(context: managedObjectContext)
		candy1.origin?.shortName = "UK"
		candy1.origin?.fullName = "United Kingdom"
		
		let candy2 = CandyBar(context: managedObjectContext)
		candy2.name = "KitKat"
		candy2.origin = Country(context: managedObjectContext)
		candy2.origin?.shortName = "UK"
		candy2.origin?.fullName = "United Kingdom"
		
		let candy3 = CandyBar(context: managedObjectContext)
		candy3.name = "Twix"
		candy3.origin = Country(context: managedObjectContext)
		candy3.origin?.shortName = "UK"
		candy3.origin?.fullName = "United Kingdom"
		
		let candy4 = CandyBar(context: managedObjectContext)
		candy4.name = "Toblerone"
		candy4.origin = Country(context: managedObjectContext)
		candy4.origin?.shortName = "CH"
		candy4.origin?.fullName = "Switzerland"
		
		let candy5 = CandyBar(context: managedObjectContext)
		candy5.name = "Oh Henry!"
		candy5.origin = Country(context: managedObjectContext)
		candy5.origin?.shortName = "CA"
		candy5.origin?.fullName = "Canada"
		
		try? managedObjectContext.save()
	}
}

struct CandyBarsList_Previews: PreviewProvider {
    static var previews: some View {
        CandyBarsList()
    }
}
