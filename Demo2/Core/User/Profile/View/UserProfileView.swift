//
//  UserProfileView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Model
import Kingfisher

struct UserProfileView: View {
    let user: User
    var body: some View {
        VStack {
            if let imageUrl = user.imageUrl {
                CircularImage(imageUrl: imageUrl, size: ImageSize.large)
            }
            
            Divider()
            
            Text(user.username)
            
            Text("\(user.age)")
        }
        .navigationTitle("profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: User.MOCK_USERS[0])
    }
}
