//
//  UseCasePokemonListProtocol.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation
import Combine

protocol UseCasePokemonListProtocol {
    func loadPokemons(offset: String?) -> AnyPublisher<PokemonListResponse, Error>
    func loadPokemonsFromFirebase( onSuccess: @escaping (PokemonListFirebaseResponse) -> Void, onFailure: @escaping (Error) -> Void)
    func loadPokemon(pokemonName: String) -> AnyPublisher<PokemonDetailResponse, Error>
}
