//
//  PokemonListFirebaseResponse.swift
//  PokedexCombine
//
//  Created by Marcos on 20/2/24.
//


typealias PokemonListFirebaseResponse = [PokemonFirebaseResponse]

import Foundation
import FirebaseFirestore

class PokemonFirebaseResponse: Identifiable{
    let id : String
    let name: String
    let attack: Int
    let category: String
    let defense: Int
    let description: String
    let evolutionId: String?
    let hp : Int
    let image: String
    let number: String
    let preevolutionId : String?
    let specialAttack: Int
    let specialDefense: Int
    let speed : Int
    let types : Array<String>
    
    init(  id : String,
           name: String,
           attack: Int,
           category: String,
           defense: Int,
           description: String,
           evolutionId: String,
           hp : Int,
           image: String,
           number: String,
           preevolutionId : String,
           specialAttack: Int,
           specialDefense: Int,
           speed : Int,
           types : Array<String>){
        
        self.id = id
        self.name = name
        self.attack = attack
        self.category = category
        self.defense = defense
        self.description = description
        self.evolutionId = evolutionId
        self.hp = hp
        self.image = image
        self.number = number
        self.preevolutionId = preevolutionId
        self.specialAttack = specialAttack
        self.specialDefense = specialDefense
        self.speed = speed
        self.types = types
        
    }
    
    convenience init?(document: QueryDocumentSnapshot){
            guard let name = document.get("name") as? String,
                  let attack = document.get("attack") as? Int,
                  let category = document.get("category") as? String,
                  let defense = document.get("defense") as? Int,
                  let description = document.get("description") as? String,
                  let evolutionId = document.get("evolutionId") as? String?,
                  let hp = document.get("hp") as? Int,
                  let image = document.get("image") as? String,
                  let number = document.get("number") as? String,
                  let preevolutionId = document.get("preevolutionId") as? String?,
                  let specialAttack = document.get("specialAttack") as? Int,
                  let specialDefense = document.get("specialDefense") as? Int,
                  let speed = document.get("speed") as? Int,
                  let types = document.get("types") as? Array<String> else {
                      return nil
                  }
                    
        self.init(id:document.documentID, 
                  name: name,
                  attack: attack,
                  category:category,
                  defense: defense,
                  description: description,
                  evolutionId: evolutionId ?? "",
                  hp: hp,
                  image: image,
                  number: number,
                  preevolutionId:preevolutionId ?? "",
                  specialAttack:specialAttack,
                  specialDefense : specialDefense,
                  speed: speed,
                  types:types
        )
        
    }
    
    
}

func pokemonFirebaseResponseToPokemon(_ pokemon: PokemonFirebaseResponse) -> Pokemon {
    return Pokemon(id:  pokemon.id, name: pokemon.name, description: pokemon.description, number: Int(pokemon.number), urlImage: pokemon.image)
}


