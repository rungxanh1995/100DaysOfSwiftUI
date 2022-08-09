//
//  AstronautView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct AstronautView: View {
	let astronaut: Astronaut
	
    var body: some View {
		GeometryReader { geoProxy in
			ScrollView {
				VStack {
					Image(astronaut.id)
						.resizable()
						.scaledToFit()
						.clipShape(RoundedRectangle(cornerRadius: 16))
						.frame(maxWidth: geoProxy.size.width * 0.9)
						.overlay(
							RoundedRectangle(cornerRadius: 16)
								.stroke(.moonshotLightColor)
						)
					
					Text(astronaut.description)
						.font(.system(.body, design: .serif))
						.padding()
				}
			}
		}
		.background(.moonshotDarkColor)
		.navigationTitle(astronaut.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
	static private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts", withExtension: "json")
	
    static var previews: some View {
		AstronautView(astronaut: astronauts["white"]!)
			.preferredColorScheme(.dark)
    }
}
