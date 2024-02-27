//
//  Pokemon.swift
//  PokedexCombine
//
//  Created by Marcos on 27/11/23.
//

import Foundation

struct Pokemon: Identifiable, Hashable {
    let id: String
    let name: String?
    let description: String?
    let number: Int?
    let urlImage: String?
}


