//
//  MainView.swift
//  PokedexCombine
//
//  Created by Marcos on 2/3/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            PokemonListView()
        }
    }
}

#Preview {
    MainView()
}
