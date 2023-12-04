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
        ScrollView{
            LazyVGrid(columns: [GridItem(),GridItem()], content: {
                ForEach(viewModel.pokemons.sorted(by: { $0.number! < $1.number! }), id: \.id) { pokemon in
                          PokemonListCellView(pokemon: pokemon)
                       }
            })
            
           
        }
       
    }
}

#Preview {
    PokemonListView()
}
