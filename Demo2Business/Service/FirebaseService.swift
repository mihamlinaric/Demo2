//
//  Interface.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

public class FirebaseService {
    
    public static func _config() {
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    }
}
