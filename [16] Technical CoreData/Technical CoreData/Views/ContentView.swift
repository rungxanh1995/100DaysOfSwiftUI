//
//  ContentView.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-26.
//

import CoreData
import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext)
	var managedObjectContext
	
    var body: some View {
		NavigationView {
			List {
				Section(
					header: Text("Entity Uniqueness"),
					footer: Text("Demonstrate how to ensure entity uniqueness using constraints")
				) {
					NavigationLink("🧙🏻‍♂️ Wizards List") {
						WizardsList()
					}
				}
				
				Section(
					header: Text("Filtering Fetch Results"),
					footer: Text("Demonstrate how to filter fetch results using predicates")
				) {
					NavigationLink("🚀 Starships List") {
						StarshipsList()
					}
				}
				
				Section(
					header: Text("Custom Filtered List"),
					footer: Text("Demonstrate how to make a custom filtered list")
				) {
					NavigationLink("🎤 Singers List") {
						SingersList()
					}
				}
				
				Section(
					header: Text("Entity Relationships"),
					footer: Text("Demonstrate how to manage relationships between entities, e.g. one-to-many.")
				) {
					NavigationLink("🍫 Candybars List") {
						CandyBarsList()
					}
				}
			}
			.navigationTitle("Technical Core Data")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
