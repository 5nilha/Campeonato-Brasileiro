//
//  TeamStandingViewModel.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

struct TeamStandingViewModel {
    
    private var teamStanding: TeamStanding?
    
    init(teamStanding: TeamStanding) {
        self.teamStanding = teamStanding
    }
    
    var position: String {
        guard let teamPosition = teamStanding?.position else { return ""}
        return "\(teamPosition)"
    }
    var positionVariation: String {
        return "\(teamStanding?.positionVariation ?? 0)"
    }
    
    var overall: String {
        return "\(teamStanding?.overall ?? 0.0)%"
    }
    
    var points: String {
        return "\(teamStanding?.points ?? 0)"
    }
    
    var matchesPlayed: String {
        return "\(teamStanding?.matchesPlayed ?? 0)"
    }
    
    var won: String {
        return "\(teamStanding?.won ?? 0)"
    }
    
    var draw: String {
        return "\(teamStanding?.draw ?? 0)"
    }
    
    var loss: String {
        return "\(teamStanding?.loss ?? 0)"
    }
    
    var goalsFor: String {
        return "\(teamStanding?.goalsFor ?? 0)"
    }
    
    var goalsAgainst: String {
        return "\(teamStanding?.goalsAgainst ?? 0)"
    }
    
    var goalsDifference: String {
        return "\(teamStanding?.goalsDifference ?? 0)"
    }
    
    var lastGames: [String] {
        return teamStanding?.lastGames ?? [String]()
    }
    var team: TeamViewModel? {
        guard let team = teamStanding?.team else {
            return nil
        }
        let teamViewModel = TeamViewModel(team: team)
        return teamViewModel
    }
}
