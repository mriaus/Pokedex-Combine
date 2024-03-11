//
//  TeamListViewModel.swift
//  PokedexCombine
//
//  Created by Marcos on 7/3/24.
//

import Foundation

protocol TeamListViewModelProtocol {
    var teams : [Team] { get }
}

final class TeamListViewModel: ObservableObject {
    let useCase: UseCaseTeamsListProtocol
    
    @Published var teams: [Team] = []


    init(useCase: UseCaseTeamsListProtocol) {
        self.useCase = useCase
        //self.getPokemons()
    }
}

