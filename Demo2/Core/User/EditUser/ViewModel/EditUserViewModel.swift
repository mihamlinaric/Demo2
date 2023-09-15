//
//  EditUserViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 15/09/2023.
//
import SwiftUI
import Foundation
import Demo2Model

final class EditUserViewModel: ObservableObject {
    let user: User
    @Published var age: String = ""
    var data: [String: Any] = [:]
    
    init(user: User) {
        self.user = user
        self.age = String(user.age)
    }
    
    func loadData() {
        if let age = Int(age), user.age != age {
            data["age"] = age
        }
    }
}
