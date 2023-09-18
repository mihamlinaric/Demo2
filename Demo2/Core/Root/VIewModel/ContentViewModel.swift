//
//  ContentViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import Combine
import Demo2Business
import Demo2Model

@MainActor
final class ContentViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var currentUser: Demo2Model.User?
    
    @MainActor
    init() {
        setupSubscribers()
    }
    
    @MainActor
    func setupSubscribers() {
        Interface.auth().$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
