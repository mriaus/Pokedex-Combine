//
//  PokemonListCellView.swift
//  PokedexCombine
//
//  Created by Marcos on 4/12/23.
//

import SwiftUI

struct PokemonListCellView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
            ZStack{
                Color.green

                AsyncImage(url: URL(string: pokemon.urlImage!)){ phase in
                    switch phase {
                    case .empty: Text("Todo") //TODO: Add placeholder
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .clipped()
                    case .failure: Text("Error")//TODO: Add error image
                    @unknown default:
                        Text("Error desconocido")
                    }
                    
                }
                //The balack shadow
                Color.black.opacity(0.35)
                VStack{
                    Spacer()
                    Spacer()
                    Text(pokemon.name ?? "No name")
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                        .frame(alignment: .leading)
                        .clipped()
                    Spacer()

                }
                
                    
                
            }
            .frame(height: 128)
            .cornerRadius(10)
            .padding(EdgeInsets(top:8, leading:16, bottom: 8, trailing: 16))
    }
}

#Preview {
    PokemonListCellView(pokemon: Pokemon(id: 3, name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"))
}
