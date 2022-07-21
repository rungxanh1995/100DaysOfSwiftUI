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
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("Daily coffee intake")
				.font(.headline)
			
			Stepper(
				domainModel.coffeeAmountCups == 1 ? "1 cup" : "\(domainModel.coffeeAmountCups) cups",
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
