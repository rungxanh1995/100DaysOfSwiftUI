//
//  BRSelectCoffeeIntakeView.swift
//  BetterRest
//
//  Created by Joe Pham on 2022-07-21.
//

import SwiftUI

struct BRSelectCoffeeIntakeView: View {
	@Binding
	var domainModel: BetterRest
	
	private var numCoffee: Int {
		domainModel.coffeeAmountCups
	}
	
    var body: some View {
		HStack {
			Text("Coffee intake:")
			
			Spacer()
			Stepper(
				numCoffee == 1 ? "1 cup" : "\(numCoffee) cups",
				value: $domainModel.coffeeAmountCups,
				in: BetterRest.reasonableCoffeeIntakeCups
			)
		}
    }
}

struct BRSelectCoffeeIntakeView_Previews: PreviewProvider {
    static var previews: some View {
		StatefulPreviewWrapper(BetterRest()) {
			BRSelectCoffeeIntakeView(domainModel: $0)
		}
    }
}
