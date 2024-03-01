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
    let authViewModel = AuthViewModel(useCase: UseCaseAuth())
    @State private var isLogged: Bool = false
    
    
    var body: some Scene {
        WindowGroup {
                if !isLogged {
                    LoginView(isLogged: $isLogged)
                }else {
                    VStack{
                        Text("Hola mundo")
                        Button("Cerrar sesion") {
                            authViewModel.logOut {
                                    isLogged = false
                            } onFailure: { error in
                                print("ERROR LOG OUT \(error)")
                                isLogged = false
                            }

                        }
                    }
                }
                
            }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environmentObject(authViewModel)

    }
}
