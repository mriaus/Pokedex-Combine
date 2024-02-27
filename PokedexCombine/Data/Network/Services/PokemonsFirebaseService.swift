//
//  PokemonsFirebaseService.swift
//  PokedexCombine
//
//  Created by Marcos on 20/2/24.
//

import Foundation
import Combine
import FirebaseFirestore


protocol PokemonsFirebaseServiceProtocol {
    func getPokemonList(onSuccess: @escaping(PokemonListFirebaseResponse) -> Void, onFailure: @escaping (Error) -> Void)
}


struct PokemonsFirebaseService: PokemonsFirebaseServiceProtocol {
    
    private let db = Firestore.firestore()
    
    func getPokemonList(onSuccess: @escaping (PokemonListFirebaseResponse) -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(FIREBASE_FL_POKEMONS_COLLECTION_NAME)
            .order(by: "number", descending: false)
            .addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    onFailure(error)
                } else if let querySnapshot = querySnapshot {
                    var pokemons: PokemonListFirebaseResponse = []
                    for document in querySnapshot.documents{
                        if let pokemon = PokemonFirebaseResponse(document: document){
                            pokemons.append(pokemon)
                        }
                    }

                    onSuccess(pokemons)
                    }
                }
        }
    }
    
