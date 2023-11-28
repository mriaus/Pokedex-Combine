//
//  UseCasePokemonList.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation
import Combine
final class UseCasePokemonList: UseCasePokemonListProtocol {
    
    func loadPokemons(offset: String?) -> AnyPublisher<PokemonListResponse, Error> {
        return PokemonsService().getPokemonList(limit: "100", offset: offset)
    }
    
    func loadPokemon(pokemonName: String) -> AnyPublisher<PokemonDetailResponse, Error> {
        return PokemonsService().getPokemonByName(pokemonName: pokemonName)
    }
    
}
