//
//  HomeListView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct HomeListView: View {
	
	@ObservedObject
	var viewModel: HomeView.ViewModel
	
	let columns = [
		GridItem(.adaptive(minimum: 1000))  // Large width to make the grid look like a list
	]
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(viewModel.missions) { eachMission in
					
					let eachMissionViewModel = MissionViewModel(
						mission: eachMission,
						astronauts: viewModel.astronauts
					)
					
					NavigationLink {
						MissionView(viewModel: eachMissionViewModel)
					} label: {
						HStack {
							MissionListImageView(
								mission: eachMission
							)
							.padding(.leading)
							
							MissionListLabelView(
								viewModel: MissionListLabelViewModel(mission: eachMission)
							)
							.padding(.trailing)
						}
						.background(.moonshotLightColor)
						.clipShape(RoundedRectangle(cornerRadius: 10))
					}
				}
			}
			.padding([.horizontal, .bottom])
		}
		.navigationTitle("Moonshot")
		.background(.moonshotDarkColor)
	}
}

struct HomeListView_Previews: PreviewProvider {
	static var previews: some View {
		HomeListView(viewModel: HomeView.ViewModel())
			.preferredColorScheme(.dark)
	}
}
