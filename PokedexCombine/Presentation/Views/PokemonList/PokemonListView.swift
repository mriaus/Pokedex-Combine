//
//  PokemonListView.swift
//  PokedexCombine
//
//  Created by Marcos on 28/11/23.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    @ObservedObject var viewModel = PokemonListViewModel(useCase: UseCasePokemonList())
    
    var body: some View {
        ScrollView{
            Button("Cerrar sesion") {
                authViewModel.logOut()
            }
            LazyVGrid(columns: [GridItem(),GridItem()], content: {
                ForEach(viewModel.pokemons, id: \.id) { pokemon in
                          PokemonListCellView(pokemon: pokemon)
                       }
            })
        }
    }
}

#Preview {
    PokemonListView()
}
