//
//  User.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let name: String?
    let password: String?
    let email: String?
}
