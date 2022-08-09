//
//  ContentView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-08.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject
	var viewModel: HomeViewModel = HomeViewModel()
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
    var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(viewModel.missions) { eachMission in
						
						let eachMissionViewModel = MissionViewModel(
							mission: eachMission,
							astronauts: viewModel.astronauts
						)
						
						NavigationLink(
							destination: MissionView(
								viewModel: eachMissionViewModel
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
        HomeView()
    }
}
