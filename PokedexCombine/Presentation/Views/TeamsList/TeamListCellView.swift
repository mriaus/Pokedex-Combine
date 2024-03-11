//
//  TeamListCellView.swift
//  PokedexCombine
//
//  Created by Marcos on 2/3/24.
//

import SwiftUI

struct TeamListCellView: View {
    var team: Team
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                //Parte inferior
                Rectangle()
                        .foregroundColor(Color.red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            LazyHStack{
                ForEach(team.pokemons, id: \.id) { pokemon in
                    AsyncImage(url: URL(string: pokemon.urlImage!)){ phase in
                        switch phase {
                        case .empty:  //TODO: Add placeholder
                            Image("pokeball")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    ZStack {
                                      Circle()
                                          .trim(from: 0.5, to: 1)
                                          .fill(.red)
                                        Rectangle()
                                            .fill(Color.gray)
                                            .frame(width: .infinity, height: 5)
                                      Circle()
                                          .trim(from: 0, to: 0.5)
                                          .fill(.white)
                                    }
                                    )
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .frame(width: 50, height: 50)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .background(
                                    ZStack {
                                      Circle()
                                          .trim(from: 0.5, to: 1)
                                          .fill(.red)
                                        Rectangle()
                                            .fill(Color.gray)
                                            .frame(width: .infinity, height: 5)
                                      Circle()
                                          .trim(from: 0, to: 0.5)
                                          .fill(.white)
                                    }
                                    )
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .frame(width: 50, height: 50)
                        case .failure: 
                            Image("pokeball")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    ZStack {
                                      Circle()
                                          .trim(from: 0.5, to: 1)
                                          .fill(.red)
                                        Rectangle()
                                            .fill(Color.gray)
                                            .frame(width: .infinity, height: 5)
                                      Circle()
                                          .trim(from: 0, to: 0.5)
                                          .fill(.white)
                                    }
                                    )
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .frame(width: 50, height: 50)
                        @unknown default:
                            Text("Fatal error")
                        }
                    }
                }
            }
        }
        .frame(height: 128)
        .cornerRadius(10)
        .padding(EdgeInsets(top:8, leading:16, bottom: 8, trailing: 16))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}


#Preview {
    TeamListCellView(team: Team(id: "team", pokemons: [ Pokemon(id: "3", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),Pokemon(id: "4", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),Pokemon(id: "5", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "6", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "7", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "8", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png")], userId: "UserID"))
}
