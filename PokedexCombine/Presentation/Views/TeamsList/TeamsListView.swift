//
//  TeamsListView.swift
//  PokedexCombine
//
//  Created by Marcos on 2/3/24.
//

import SwiftUI

struct TeamsListView: View {
    
    @State var viewModel: TeamListViewModelProtocol
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(viewModel.teams, id: \.id) { team in
                    TeamListCellView(team: team)
                       }
            })
        }
    }
}

#Preview {
    TeamsListView(viewModel: TeamListMockViewModel(useCase: UseCaseTeamsList()))
}
