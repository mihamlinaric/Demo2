//
//  UserListRowViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import Foundation
import Demo2Business

final class UserListRowViewModel: ObservableObject {
    func isCurrentUser(uid: String) -> Bool {
        return UserService.isCurrentUser(uid: uid)
    }
}
