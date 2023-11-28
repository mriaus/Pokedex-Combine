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
        VStack{
            ForEach(viewModel.pokemons, id: \.id) { pokemon in
                       Text(pokemon.name ?? "Unknown")
                   }
        }
       
    }
}

#Preview {
    PokemonListView()
}
