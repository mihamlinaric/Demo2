//
//  Demo2App.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import SwiftUI
import FirebaseCore

public class AppDelegate: NSObject, UIApplicationDelegate {
    public func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Demo2App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
