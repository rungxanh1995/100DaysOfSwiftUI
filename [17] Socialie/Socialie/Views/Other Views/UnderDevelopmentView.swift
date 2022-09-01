//
//  UnderDevelopmentView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-01.
//

import SwiftUI

struct UnderDevelopmentView: View {
    var body: some View {
		VStack {
			Symbols.Images.tools
				.font(.system(size: 80))
			Text("Uh Oh!")
				.font(.title.bold())
			Text("This view is spared for future development. I'd come back to it when my technical skills allow 🙂")
				.multilineTextAlignment(.center)
				.padding()
		}
		.foregroundColor(.secondary)
		.padding()
		.navigationTitle("Feature Under Development")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct UnderDevelopmentView_Previews: PreviewProvider {
    static var previews: some View {
        UnderDevelopmentView()
    }
}
