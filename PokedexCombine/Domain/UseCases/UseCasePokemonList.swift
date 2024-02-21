//
//  UseCasePokemonList.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation
import Combine
final class UseCasePokemonList: UseCasePokemonListProtocol {
    
    func loadPokemonsFromFirebase(onSuccess: @escaping (PokemonListFirebaseResponse) -> Void, onFailure: @escaping (Error) -> Void) {
        return PokemonsFirebaseService().getPokemonList(onSuccess: onSuccess, onFailure: onFailure)
    }
    
    
    func loadPokemons(offset: String?) -> AnyPublisher<PokemonListResponse, Error> {
        
        return PokemonsService().getPokemonList(limit: "151", offset: offset)
        
        
    }
    
    func loadPokemon(pokemonName: String) -> AnyPublisher<PokemonDetailResponse, Error> {
        return PokemonsService().getPokemonByName(pokemonName: pokemonName)
    }
    
}
