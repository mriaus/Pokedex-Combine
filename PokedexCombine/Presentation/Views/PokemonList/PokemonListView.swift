//
//  PokemonListView.swift
//  PokedexCombine
//
//  Created by Marcos on 28/11/23.
//

import SwiftUI

struct PokemonListView: View {
    @Binding var isLogged: Bool
    @EnvironmentObject var authViewModel: AuthViewModel

    @ObservedObject var viewModel = PokemonListViewModel(useCase: UseCasePokemonList())
    
    var body: some View {
        ScrollView{
            Button("Cerrar sesion") {
                authViewModel.logOut {
                        isLogged = false
                } onFailure: { error in
                    print("ERROR LOG OUT \(error)")
                    isLogged = false
                }
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
    PokemonListView(isLogged: .constant(true))
}
