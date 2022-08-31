//
//  UserView.swift
//  Socialie
//
//  Created by Joe Pham on 2022-08-31.
//

import SwiftUI

struct UserView: View {
	private(set) var user: User
	
    var body: some View {
		Text(user.name)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
		UserView(user: User.sampleUser)
    }
}
