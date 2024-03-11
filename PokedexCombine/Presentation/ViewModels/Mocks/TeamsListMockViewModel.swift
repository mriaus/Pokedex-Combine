//
//  TeamsListMockViewModel.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

import Foundation

final class TeamListMockViewModel: ObservableObject, TeamListViewModelProtocol {
    var teams: [Team]
    var useCase : UseCaseTeamsListProtocol
    
    init(useCase: UseCaseTeamsListProtocol) {
        self.useCase = useCase
        self.teams = [
            Team(id: "team1", pokemons: [ Pokemon(id: "3", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),Pokemon(id: "4", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),Pokemon(id: "5", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "6", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "7", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "8", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png")], userId: "UserID"),
            Team(id: "team2", pokemons: [ Pokemon(id: "3", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),Pokemon(id: "4", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),Pokemon(id: "5", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "6", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "7", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "8", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png")], userId: "UserID"),
            Team(id: "team3", pokemons: [ Pokemon(id: "3", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),Pokemon(id: "4", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),Pokemon(id: "5", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "6", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "7", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),Pokemon(id: "8", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png")], userId: "UserID")
        ]
    }
    
}
