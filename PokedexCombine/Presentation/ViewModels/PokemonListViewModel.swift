//
//  PokemonListViewModel.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation
import Combine
final class PokemonListViewModel: ObservableObject {
    
    let useCase: UseCasePokemonListProtocol
    
    @Published var pokemons: [Pokemon] = []
    private var totalPokemons = 0
    var suscriptors = Set<AnyCancellable>()
    
    init(useCase: UseCasePokemonListProtocol) {
        print("Entra en el init")

            self.useCase = useCase
        self.getPokemons()
        }
    
    func getPokemons() {
        let offset = pokemons.count + 1
        if(totalPokemons < pokemons.count || totalPokemons == 0){
            print("Entra en el if")
            useCase.loadPokemons(offset: String(offset))
                .sink { completion in
                    //TODO: Check if errors
                    print("completion GETPOKEMONS \(completion)")
                } receiveValue: { [weak self] pokemonDTO in
                    print("Dentro del receiveValue \(pokemonDTO)")
                    pokemonDTO.results.map { result in
                        print(result)
                    
                    }
                }
                .store(in: &suscriptors)

        }
    }
    
    func getPokemonById(pokemonId: Int) {
         useCase.loadPokemon(pokemonId: pokemonId)
            .sink { completion in
                //TODO
            } receiveValue: { pokemonDTO in
                print("GET POKEMON BY ID RESULT \(pokemonDTO)")
            }

    }
    
}
