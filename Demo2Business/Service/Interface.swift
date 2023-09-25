//
//  Interface.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import Foundation


public class Interface {
    private static let shared = Interface()
    private init() { }
    
    public static func auth() -> AuthenticationService {
        return shared._authentication
    }
    
    private let _authentication = AuthenticationService()
}
