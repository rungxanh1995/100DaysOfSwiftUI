//
//  MHKeypadView.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import SwiftUI

struct MHKeypadView: View {
	var actionPerformed: ((MHKeypadType) -> ())?
	
	var body: some View {
		GeometryReader { geo in
			VStack(spacing: 10) {
				
				Spacer()
					.frame(
						minWidth: 0,
						maxWidth: .infinity,
						minHeight: 0,
						maxHeight: .infinity,
						alignment: .top
					)
				
				// Keypad buttons 1-9
				ForEach(0...2, id: \.self) { i in
					HStack {
						ForEach(1...3, id: \.self) { j in
							Button(action: {
								actionPerformed?(
									MHKeypadType.init(rawValue: j + i * 3) ?? .none
								)
							}) {
								let buttonNumber = "\(j + i * 3)"
								Text(buttonNumber)
									.font(.system(.title, design: .rounded))
									.modifier(MHKeypadStyle(width: self.getWidth(geo), height: self.getHeight()))
							}
						}
					}
				}
				
				// Bottom keypad row
				HStack {
					Button(action: { actionPerformed?(.backspace) }) {
						Image(systemName: "delete.left")
							.font(.system(.title, design: .rounded))
							.modifier(MHKeypadStyle(width: self.getWidth(geo), height: self.getHeight(), tintColor: Color.pink))
					}
					Button(action: { actionPerformed?(.k0) }) {
						Text("0")
							.font(.system(.title, design: .rounded))
							.modifier(MHKeypadStyle(width: self.getWidth(geo), height: self.getHeight()))
					}
					Button(action: { actionPerformed?(.done) }) {
						Image(systemName: "checkmark")
							.font(.system(.title, design: .rounded))
							.modifier(MHKeypadStyle(width: self.getWidth(geo), height: self.getHeight(), tintColor: Color.teal))
					}
				}
			}
		}
	}
}

extension MHKeypadView {
	private func getWidth(_ geoProxy: GeometryProxy) -> CGFloat {
		let buttonSpacing: CGFloat = 10
		return geoProxy.size.width / 3 - buttonSpacing
	}
	
	private func getHeight() -> CGFloat {
		return 50
	}
}

struct MHKeypad_Previews: PreviewProvider {
	static var previews: some View {
		MHKeypadView()
	}
}
