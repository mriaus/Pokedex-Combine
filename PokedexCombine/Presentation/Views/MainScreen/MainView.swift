//
//  MainView.swift
//  PokedexCombine
//
//  Created by Marcos on 2/3/24.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {
        TabView{
            PokemonListView(viewModel: PokemonListViewModel(useCase: UseCasePokemonList()))
                .tabItem {
                    Label("Home", systemImage: "list.bullet")
                }
            TeamsListView(viewModel: TeamListViewModel(useCase: UseCaseTeamsList()) as! TeamListViewModelProtocol)
                .tabItem {
                    Label("Teams", systemImage: "person.3.fill")
                }
            EmptyView()
                .tabItem {
                    Label("Profile", systemImage: "theatermask.and.paintbrush.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
