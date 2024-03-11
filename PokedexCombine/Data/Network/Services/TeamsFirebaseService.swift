//
//  TeamsFirebaseService.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

import Foundation
import FirebaseFirestore

protocol TeamsFirebaseServiceProtocol {
    //Probar si firebase retorna algo al guardar un elemento
    func saveTeam(onSuccress: @escaping() -> Void, onFailure: @escaping (Error) -> Void)
}

struct TeamsFirebaseService: TeamsFirebaseServiceProtocol {
    
    private let db = Firestore.firestore()
    
    func saveTeam(onSuccress: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        //Cambiar el nombre por el de teams
     //   db.collection(FIREBASE_FL_POKEMONS_COLLECTION_NAME)
       //     .addDocument(data: <#T##[String : Any]#>)
        
    }
    
    
}
