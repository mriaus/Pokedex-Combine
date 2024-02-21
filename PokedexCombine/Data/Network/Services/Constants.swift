//
//  Constants.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation

let server = "https://pokeapi.co/api/v2/"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}

let contentType = "application/json"

enum endpoints: String {
    case pokemons = "pokemon"
    case pokemonDetail = "pokemon-form" //Detail ??
    case characteristics = "characteristic" // To get the description
}

//Firebase
let FIREBASE_POKEMONS_COLLECTION_NAME = "pokemons"
