//
//  Demo2App.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import SwiftUI
import Demo2Business

@main
struct Demo2App: App {
    
    init() { FirebaseService._config() }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
