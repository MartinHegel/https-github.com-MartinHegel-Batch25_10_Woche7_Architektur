//
//  Batch25_10App.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}



@main
struct Batch25_10App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    /*
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
     */
    

    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
}
