//
//  StandingTableObservable.swift
//  Foonews
//
//  Created by Spartan on 2/28/24.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class StandingTableObservable {
    
    let client = FootballDataClient(apiKey: apiKey)
    
    var fetchPhase = FetchPhase<[TeamStandingTable]>.intial
    
    var standings: [TeamStandingTable]? {fetchPhase.value}
    
    func fetchStandings(competition: Competition) async{
//        fetchPhase = .fetching
//        
//        do{
//            let standings = try await client .fetchStandings(competitionId: competition.id)
//            if Task.isCancelled{
//                return
//            }
//            fetchPhase = .success(standings)
//        }catch{
//            fetchPhase = .failue(error)
//        }
        
        fetchPhase = .success(TeamStandingTable.stubs)
    }
    
}

extension TeamStandingTable {
    
    static var stubs: [TeamStandingTable]{
        
        let url = Bundle.main.url(forResource: "standings", withExtension: "json")!
        
        let standingResponse: StandingResponse = Utilities.loadStub(url: url)
        return standingResponse.standings!.first {$0.type == "TOTAL" }!.table
    }
    
}
