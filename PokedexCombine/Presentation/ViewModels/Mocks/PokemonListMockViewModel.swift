//
//  PokemonListMockViewModel.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

import Foundation
import Combine
final class PokemonListMockViewModel: ObservableObject, PokemonListViewModelProtocol {
    
    let useCase: UseCasePokemonListProtocol
    
    @Published var pokemons: [Pokemon] = []
    private var totalPokemons = 0
    var suscriptors = Set<AnyCancellable>()
    
    init(useCase: UseCasePokemonListProtocol) {
        self.useCase = useCase
        //self.getPokemons()
        self.getPokemonsFirebase()
    }
    
    func getPokemons() {
        let offset = pokemons.count == 0 ? 0 : pokemons.count + 1
        if(totalPokemons < pokemons.count || totalPokemons == 0){
            print("Entra en el if")
            useCase.loadPokemons(offset: String(offset))
                .sink { completion in
                    //TODO: Check if errors
                    print("completion GETPOKEMONS \(completion)")
                } receiveValue: { [weak self] pokemonDTO in
                    pokemonDTO.results?.forEach({ pokemon in
                        if let pokemonName = pokemon.name {
                            self?.getPokemonByName(pokemonName: pokemonName)
                        }
                    })
                }
                .store(in: &suscriptors)
        }
    }
    
    func getPokemonByName(pokemonName: String) {
        useCase.loadPokemon(pokemonName: pokemonName)
            .sink { completion in
                //TODO
                print("Completion de getPokemonByName \(completion)")
            } receiveValue: {[weak self] pokemonDTO in
                let pokemonToAppend = Pokemon(id: String(pokemonDTO.id), name: pokemonDTO.name, description: "No description", number: pokemonDTO.id, urlImage: pokemonDTO.sprites?.frontDefault)
                self?.pokemons.append(pokemonToAppend)
            }
            .store(in: &suscriptors)
    }
    
    func getPokemonsFirebase(){
        self.pokemons = [Pokemon(id: "1", name: "Venusaur", description: "", number: 0001, urlImage:                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),
                         Pokemon(id: "2", name: "Venusaur", description: "", number: 0001, urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png")]
    }
    
}