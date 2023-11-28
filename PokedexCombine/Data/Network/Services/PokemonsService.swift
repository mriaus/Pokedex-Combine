//
//  PokemonsServices.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation
import Combine

protocol PokemonsServiceProtocol {
    func getPokemonList(limit: String?, offset: String?) -> AnyPublisher<PokemonListResponse, Error>
    func getPokemonByName(pokemonName: String) -> AnyPublisher<PokemonDetailResponse, Error>
}

struct PokemonsService: PokemonsServiceProtocol {
    func getPokemonList(limit: String?, offset: String?) -> AnyPublisher<PokemonListResponse, Error> {
        
        let urlPokemonList = "\(server)\(endpoints.pokemons.rawValue)"
        
        var urlComponents = URLComponents(string: urlPokemonList)!
                urlComponents.queryItems = [
                    URLQueryItem(name: "offset", value: offset)
                ]
        var request: URLRequest = URLRequest(url: urlComponents.url!)
                request.httpMethod = HTTPMethods.get
        
        return URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                    .decode(type: PokemonListResponse.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
    
    func getPokemonByName(pokemonName: String) -> AnyPublisher<PokemonDetailResponse, Error> {
        let urlPokemon = "\(server)\(endpoints.pokemons.rawValue)/\(pokemonName)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlPokemon)!)
                request.httpMethod = HTTPMethods.get
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: PokemonDetailResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    
}

