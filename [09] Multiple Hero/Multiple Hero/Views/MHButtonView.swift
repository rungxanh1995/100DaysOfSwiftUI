//
//  MHButtonView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-02.
//

import SwiftUI

struct MHButtonView: View {
	var buttonText: String
	var tintColor: Color = .teal
	var buttonAction: (() -> Void)
	
	var body: some View {
		Button(buttonText) {
			buttonAction()
		}
		.font(.system(.title, design: .rounded).bold())
		.padding()
		.buttonStyle(.borderedProminent)
		.clipShape(RoundedRectangle(cornerRadius: 12))
		.tint(tintColor)
	}
}

struct MHButtonView_Previews: PreviewProvider {
    static var previews: some View {
		MHButtonView(buttonText: "Multiple Hero") { }
    }
}
