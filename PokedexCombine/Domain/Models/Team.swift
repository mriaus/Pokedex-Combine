//
//  Team.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

import Foundation

struct Team: Identifiable, Hashable {
    let id: String
    let pokemons: Array<Pokemon>
    let userId: String
}
