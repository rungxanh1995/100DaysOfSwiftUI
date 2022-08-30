//
//  StarshipsList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import SwiftUI

/// This view was used to teach
/// how to filter a fetch results with predicates
struct StarshipsList: View {
	@Environment(\.managedObjectContext)
	var managedObjectContext
	
	@FetchRequest(
		sortDescriptors: [],
		predicate: NSCompoundPredicate(
			andPredicateWithSubpredicates: [
				Predicates.shipNamesNotStartsWithD,
				Predicates.shipsInSomeUniverses
			]
		)
	)
	var ships: FetchedResults<Starship>
	
    var body: some View {
		VStack {
			List(ships, id: \.self) { (ship: Starship) in
				Text(ship.name ?? "Unknown name")
			}
			
			Button("Add Examples") {
				addExamples()
			}
			.buttonStyle(.bordered)
			.tint(.red)
		}
		.navigationTitle("Starships List")
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension StarshipsList {
	func addExamples() -> Void {
		let ship1 = Starship(context: managedObjectContext)
		ship1.name = "Enterprise"
		ship1.universe = "Star Trek"
		
		let ship2 = Starship(context: managedObjectContext)
		ship2.name = "Defiant"
		ship2.universe = "Star Trek"
		
		let ship3 = Starship(context: managedObjectContext)
		ship3.name = "Millennium Falcon"
		ship3.universe = "Star Wars"
		
		let ship4 = Starship(context: managedObjectContext)
		ship4.name = "Executor"
		ship4.universe = "Star Wars"
		
		try? managedObjectContext.save()
	}
}

#if DEBUG
struct ShipsList_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsList()
    }
}
#endif
