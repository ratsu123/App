//
//  TestAppApp.swift
//  Shared
//
//  Created by Ratmir Suleyev on 26.08.2022.
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

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
      
    WindowGroup {
        let viewModel = AppViewModel()
        ContentView()
            .environmentObject(viewModel)
            
    }
  }
}
