//
//  ContentView.swift
//  Guess Flag
//
//  Created by Joe Pham on 2022-07-14.
//

import SwiftUI

struct ContentView: View {
	private var countries: [CountryModel] = CountryModel.sampleData
	private var randomCorrectAnswer = Int.random(in: 0...2)
	
    var body: some View {
		ZStack {
			LinearGradient(
				gradient: Gradient(colors: [.yellow, .blue, .indigo]), startPoint: .top, endPoint: .bottomTrailing
			)
			.ignoresSafeArea()
			
			VStack {
				
				VStack {
					Text("Tap flag of")
					Text(countries.element(randomCorrectAnswer).name)
				}
				.foregroundStyle(.primary)
				
				ForEach(0..<3) { i in
					Button {
						print("\(countries.element(i).name) tapped!")
					} label: {
						Image(countries.element(i).name)
							.renderingMode(.original)
					}
					.clipShape(RoundedRectangle(cornerRadius: 25))
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
