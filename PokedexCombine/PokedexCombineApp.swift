//
//  PokedexCombineApp.swift
//  PokedexCombine
//
//  Created by Marcos on 20/11/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Configura Firebase Analytics
        Analytics.setAnalyticsCollectionEnabled(true)
        
        return true
  }
}




@main
struct PokedexCombineApp: App {
    // register app delegate for Firebase setup

     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                PokemonListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            })
            
        }
    }
}
