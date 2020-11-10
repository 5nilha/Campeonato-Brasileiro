//
//  CampeonatoBrasileiroViewModel.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

struct CampeonatoBrasileiroViewModel {
    
    private let campeonatoBrasileiro: CampeonatoBrasileiro
    
    init(campeonatoBrasileiro: CampeonatoBrasileiro) {
        self.campeonatoBrasileiro = campeonatoBrasileiro
    }
    
    var name: String? {
        return edition?.name
    }
    
    var status: String? {
        return campeonatoBrasileiro.status
    }
    
    var type: String? {
        return campeonatoBrasileiro.type
    }
    
    var season: String? {
        return edition?.season
    }
    
    var standingTable: [TeamStandingViewModel]? {
        guard let standingTable = campeonatoBrasileiro.standingTable else {
            return nil
        }
        let leagueStandingViewModel = standingTable.map { (teamStanding) -> TeamStandingViewModel in
            return TeamStandingViewModel(teamStanding: teamStanding)
        }
        return leagueStandingViewModel.sorted { (teamA, teamB) -> Bool in
            guard let teamAPosition = teamA.position, let teamBPosition = teamB.position else {
                return false
            }
            return teamAPosition < teamBPosition
        }
    }
    
    var matches: [[MatchViewModel]]? {
        var leagueMaches = [[MatchViewModel]]()
        guard let matches = campeonatoBrasileiro.matches else { return nil }
        for (round, roundMatchesList) in matches {
            let gameRound = Int(round.onlyNumbers) ?? 0
            var roundMatches = [MatchViewModel]()
            for match in roundMatchesList {
                roundMatches.append(MatchViewModel(match: match, gameRound: gameRound))
            }
            leagueMaches.append(roundMatches.sorted(by: { (matchA, matchB) -> Bool in
                guard let matchAData = matchA.date, let matchBData = matchB.date else { return true}
                return matchAData < matchBData
            }))
        }
        return leagueMaches.sorted { (matchA, matchB) -> Bool in
            guard let matchARound = matchA.first, let MatchBRound = matchB.first else { return true }
            return matchARound.round < MatchBRound.round
        }
    }
    
    private var edition: EditionViewModel? {
        guard let edition = campeonatoBrasileiro.edition else {
            return nil
        }
        let editionViewModel = EditionViewModel(edition: edition)
        return editionViewModel
    }
}
