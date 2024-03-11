//
//  UseCaseTeamsList.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

protocol UseCaseTeamsListProtocol {
    func createTeam(pokemons: Array<String>, userId: String)
    func saveAsFavorite()
    func removeTeam()
}
