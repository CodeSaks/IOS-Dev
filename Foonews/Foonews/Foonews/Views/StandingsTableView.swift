//
//  StandingsTableView.swift
//  Foonews
//
//  Created by Spartan on 2/28/24.
//

import SwiftUI
import SVGImageSwiftUI
import XCAFootballDataClient

struct StandingsTableView: View {
    
    let competition: Competition
    var vm = StandingTableObservable()
    //@State private var clubs: [TeamStandingTable] = []
    var body: some View {
        
        Table(of: TeamStandingTable.self) {
            
            TableColumn("Club") { club in
                HStack {
                    Text(club.positionText).fontWeight(.bold).frame(minWidth: 20)
                    
                    if let crest = club.team.crest, crest.hasSuffix("svg") {
                        SVGImage(url: URL(string: crest)!, size: .init(width: 40, height: 40))
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                    } else {
                        AsyncImage(url: URL(string: club.team.crest ?? "")) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable()
                            default: Circle().foregroundStyle(Color.gray.opacity(0.5))
                            }
                            
                        }
                        .frame(width: 40, height: 40)
                    }
                    
                    Text(club.team.name)
                }
            }
        }rows: {
            ForEach(vm.standings ?? []){
                TableRow($0)
            }
        }.frame(minWidth: 264)
        
        Table(of: TeamStandingTable.self){
            TableColumn("W"){
                Text($0.wonText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("D"){
                Text($0.drawText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("L"){
                Text($0.lostText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("GF"){
                Text($0.goalsForText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("GA"){
                Text($0.goalsAgainstText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("GD"){
                Text($0.goalDifferenceText).frame(minWidth: 50)
            }.width(50)
            
            TableColumn("Pts"){
                Text($0.pointsText).frame(minWidth: 50)
            }.width(50)
            
            
        } rows: {
            ForEach(vm.standings ?? []){
                TableRow($0)
            }
        }.foregroundStyle(Color.primary).navigationTitle(competition.name).task {
            await vm.fetchStandings(competition: competition)
        }
    }
}


#Preview {
    NavigationStack {
        StandingsTableView(competition: .defaultCompetitions[1])
    }
}

