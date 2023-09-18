//
//  Interface.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import Foundation
import Demo2Model
import Demo2Authentication

public class Interface {
    private static let shared = Interface()
    private init() { }
    
    public static func auth() -> AuthenticationService {
        return shared._authentication
    }
    
    
    // Include services that need state handling ???
    private let _authentication = AuthenticationService()
}
