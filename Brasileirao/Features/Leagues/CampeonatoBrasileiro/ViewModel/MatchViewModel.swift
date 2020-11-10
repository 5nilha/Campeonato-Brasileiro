//
//  MatchViewModel.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

class MatchViewModel {
    
    private let match: Match
    let round: Int
    
    init(match: Match, gameRound: Int) {
        self.match = match
        self.round = gameRound
    }
    
    var score: String? {
        return match.score
    }
    
    var homeTeam: TeamViewModel? {
        guard let homeTeam = match.homeTeam else { return nil }
        return TeamViewModel(team: homeTeam)
    }
    
    var awayTeam: TeamViewModel? {
        guard let awayTeam = match.awayTeam else { return nil }
        return TeamViewModel(team: awayTeam)
    }
    
    var scoreHomeTeam: Int? {
        return match.scoreHomeTeam
    }
    
    var scoreAwayTeam: Int? {
        return match.scoreAwayTeam
    }
    
    var status: String? {
        return match.status
    }
    
    var gameDate: String? {
        return match.gameDate
    }
    var gameTime: String? {
        return match.gameTime
    }
    
    var date: Date? {
        guard let dateISOString = match.gameDateIso else { return nil }
        return Date.dateFromISOString(string: dateISOString)
    }
    
    var stadiumName: String? {
        guard let stadium = match.stadium else { return nil }
        return stadium.name
    }
}
