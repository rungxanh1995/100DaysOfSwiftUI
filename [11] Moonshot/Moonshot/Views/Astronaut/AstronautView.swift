//
//  AstronautView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct AstronautView: View {
	
	@ObservedObject
	var viewModel: AstronautViewModel
	
    var body: some View {
		GeometryReader { geoProxy in
			ScrollView {
				VStack {
					Image(viewModel.astronaut.id)
						.resizable()
						.scaledToFit()
						.clipShape(RoundedRectangle(cornerRadius: 16))
						.frame(maxWidth: geoProxy.size.width * 0.9)
						.overlay(
							RoundedRectangle(cornerRadius: 16)
								.stroke(.moonshotLightColor)
						)
					
					Text(viewModel.astronaut.description)
						.font(.system(.body, design: .serif))
						.padding()
				}
			}
		}
		.background(.moonshotDarkColor)
		.navigationTitle(viewModel.astronaut.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
	static private let astronauts: [String: Astronaut] = Astronauts.allAstronauts
	
    static var previews: some View {
		AstronautView(
			viewModel: AstronautViewModel(astronaut: astronauts["white"]!)
		)
		.preferredColorScheme(.dark)
    }
}
