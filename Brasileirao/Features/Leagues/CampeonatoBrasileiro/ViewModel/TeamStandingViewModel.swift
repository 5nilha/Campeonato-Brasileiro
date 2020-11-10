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
    
    var position: Int? {
        return teamStanding?.position
    }
    var positionVariation: Int {
        return teamStanding?.positionVariation ?? 0
    }
    
    var overall: Double {
        return teamStanding?.overall ?? 0.0
    }
    
    var points: Int {
        return teamStanding?.points ?? 0
    }
    
    var matchesPlayed: Int {
        return teamStanding?.matchesPlayed ?? 0
    }
    
    var won: Int {
        return teamStanding?.won ?? 0
    }
    
    var draw: Int {
        return teamStanding?.draw ?? 0
    }
    
    var loss: Int {
        return teamStanding?.loss ?? 0
    }
    
    var goalsFor: Int {
        return teamStanding?.goalsFor ?? 0
    }
    
    var goalsAgainst: Int {
        return teamStanding?.goalsAgainst ?? 0
    }
    
    var goalsDifference: Int {
        return teamStanding?.goalsDifference ?? 0
    }
    
    var goalsAveragePerGame: Double {
        return Double(goalsFor) / Double(matchesPlayed)
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
