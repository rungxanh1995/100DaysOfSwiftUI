//
//  HomeGridView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct HomeGridView: View {
	
	@ObservedObject
	var viewModel: HomeView.ViewModel
	
	@Binding
	var selectedView: Int?
	
	let columns = [
		GridItem(.adaptive(minimum: 120))
	]
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(viewModel.missions) { eachMission in
					
					let eachMissionViewModel = MissionView.ViewModel(
						mission: eachMission,
						astronauts: viewModel.astronauts
					)
					
					NavigationLink(
						destination: MissionView(
							viewModel: eachMissionViewModel
						),
						tag: eachMissionViewModel.mission.id,
						selection: $selectedView
					) {
						VStack {
							MissionListImageView(
								mission: eachMission
							)
							
							MissionListLabelView(
								viewModel: MissionListLabelView.ViewModel(
									mission: eachMission)
							)
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
	}
}

struct HomeGridView_Previews: PreviewProvider {
	@State
	private static var selectedView: Int? = 1
	
	static var previews: some View {
		let viewModel = HomeView.ViewModel()
		viewModel.getData()
		
		return HomeGridView(viewModel: viewModel, selectedView: $selectedView)
	}
}
