//
//  PokemonListView.swift
//  PokedexCombine
//
//  Created by Marcos on 28/11/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var viewModel = PokemonListViewModel(useCase: UseCasePokemonList())
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonListView()
}
