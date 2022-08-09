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
								
								MissionListLabelView(
									viewModel: MissionListLabelViewModel(
										mission: eachMission)
								)
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
