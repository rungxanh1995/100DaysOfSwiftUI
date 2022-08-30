//
//  WizardsList.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//

import SwiftUI

/// This view was used to teach
/// how to ensure Core Data objects uniqueness using constraints
struct WizardsList: View {
	@Environment(\.managedObjectContext)
	var managedObjectContext
	
	@FetchRequest(sortDescriptors: [])
	var wizards: FetchedResults<Wizard>
	
    var body: some View {
		VStack {
			List(wizards, id: \.self) { (wizard: Wizard) in
				Text(wizard.name ?? "--")
			}
			
			HStack {
				Button("Add") {
					addSameEntityExample()
				}
				
				Spacer()
				
				Button("Save") {
					do {
						try managedObjectContext.save()
					} catch {
						print(error.localizedDescription)
					}
				}
			}
			.padding()
			.buttonStyle(.bordered)
			.tint(.red)
		}
		.navigationTitle("Wizards List")
		.navigationBarTitleDisplayMode(.inline)
    }
}

private extension WizardsList {
	func addSameEntityExample() -> Void {
		let wizard = Wizard(context: managedObjectContext)
		wizard.name = "Harry Potter"
	}
}

#if DEBUG
struct WizardsList_Previews: PreviewProvider {
    static var previews: some View {
        WizardsList()
    }
}
#endif
