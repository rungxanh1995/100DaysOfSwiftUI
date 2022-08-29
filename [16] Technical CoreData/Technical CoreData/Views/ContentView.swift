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
//		WizardsList()
//		StarshipsList()
//		SingersList()
		CandyBarsList()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
