//
//  BYHabitDetailCell.swift
//  Better You
//
//  Created by Joe Pham on 2022-08-16.
//

import SwiftUI

struct BYHabitDetailCell: View {
	let title: String
	let caption: LocalizedStringKey
	
	var body: some View {
		VStack {
			Text(title)
				.font(.system(.headline, design: .rounded).bold())
				.multilineTextAlignment(.center)
				.padding()
			
			Spacer()
			
			Text(caption)
				.font(.system(.caption, design: .rounded))
				.padding(6)
				.frame(maxWidth: .infinity)
				.background(.gray.opacity(0.15))
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.regularMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 12))
		.overlay(
			RoundedRectangle(cornerRadius: 12)
				.stroke(.quaternary)
		)
	}
}

struct BYHabitDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        BYHabitDetailCell(title: "Habit Name", caption: "Name")
			.preferredColorScheme(.dark)
    }
}
