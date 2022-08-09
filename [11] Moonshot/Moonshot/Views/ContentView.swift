//
//  ContentView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import SwiftUI

struct ContentView: View {
	
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts", withExtension: "json")
	let missions: [Mission] = Bundle.main.decode("missions", withExtension: "json")
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
    var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(missions) { eachMission in
						NavigationLink(
							destination: MissionView(
								mission: eachMission,
								astronauts: astronauts
							)
						) {
							VStack {
								Image(eachMission.imageName)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
									.padding()
								
								VStack {
									Text(eachMission.displayName)
										.font(.system(.headline, design: .serif))
										.foregroundColor(.white)
									
									Text(eachMission.formattedLaunchDate)
										.font(.system(.caption, design: .serif))
										.foregroundColor(.white.opacity(0.75))
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.moonshotLightColor)
							}
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
									.stroke(.moonshotLightColor))
						}
					}
				}
				.padding([.horizontal, .bottom])
			}
			.navigationTitle("Moonshot")
			.background(.moonshotDarkColor)
			.preferredColorScheme(.dark)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
