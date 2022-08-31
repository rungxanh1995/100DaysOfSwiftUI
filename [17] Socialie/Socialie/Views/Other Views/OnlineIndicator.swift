//
//  OnlineIndicator.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct OnlineIndicator: View {
	let isOnline: Bool
	
	var body: some View {
		Image(systemName:"circle.fill")
			.font(.callout)
			.foregroundColor(isOnline ? .green : nil)
			.background(.white)
			.clipShape(Circle())
			.overlay(Circle().stroke(.white, lineWidth: 3.0))
			.shadow(
				color: isOnline ? .green : .gray,
				radius: isOnline ? 3 : 1
			)
	}
}

struct ImageWatermark_Previews: PreviewProvider {
    static var previews: some View {
		OnlineIndicator(isOnline: true)
    }
}
