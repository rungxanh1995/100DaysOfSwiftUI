//
//  HomeGridView.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-09.
//

import SwiftUI

struct HomeGridView: View {
	
	@ObservedObject
	var viewModel: HomeViewModel
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
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
							MissionListImageView(
								mission: eachMission
							)
							
							MissionListLabelView(
								viewModel: MissionListLabelViewModel(
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
	static var previews: some View {
		HomeGridView(viewModel: HomeViewModel())
	}
}
