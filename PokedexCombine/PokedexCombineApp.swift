//
//  PokedexCombineApp.swift
//  PokedexCombine
//
//  Created by Marcos on 20/11/23.
//

import SwiftUI

@main
struct PokedexCombineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PokemonListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
