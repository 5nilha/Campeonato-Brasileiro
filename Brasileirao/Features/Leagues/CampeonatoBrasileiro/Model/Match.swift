//
//  Match.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class Match: Decodable {
    public private (set) var id: Int?
    public private (set) var score: String?
    public private (set) var homeTeam: Team?
    public private (set) var awayTeam: Team?
    public private (set) var scoreHomeTeam: Int?
    public private (set) var scoreAwayTeam: Int?
    public private (set) var status: String?
    public private (set) var slug: String?
    public private (set) var gameDateIso: String?
    public private (set) var gameDate: String?
    public private (set) var gameTime: String?
    public private (set) var gameLink: String?
    public private (set) var stadium: Stadium?
    
    enum CodingKeys: String, CodingKey {
        case id = "partida_id"
        case score = "placar"
        case homeTeam = "time_mandante"
        case awayTeam = "time_visitante"
        case scoreHomeTeam = "placar_mandante"
        case scoreAwayTeam = "placar_visitante"
        case status = "status"
        case slug = "slug"
        case gameDateIso = "data_realizacao_iso"
        case gameDate = "data_realizacao"
        case gameTime = "hora_realizacao"
        case gameLink = "_link"
        case stadium = "estadio"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.score = try container.decodeIfPresent(String.self, forKey: .score)
        self.homeTeam = try container.decodeIfPresent(Team.self, forKey: .homeTeam)
        self.awayTeam = try container.decodeIfPresent(Team.self, forKey: .awayTeam)
        self.scoreHomeTeam = try container.decodeIfPresent(Int.self, forKey: .scoreHomeTeam)
        self.scoreAwayTeam = try container.decodeIfPresent(Int.self, forKey: .scoreAwayTeam)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.gameDateIso = try container.decodeIfPresent(String.self, forKey: .gameDateIso)
        self.gameDate = try container.decodeIfPresent(String.self, forKey: .gameDate)
        self.gameTime = try container.decodeIfPresent(String.self, forKey: .gameTime)
        self.gameLink = try container.decodeIfPresent(String.self, forKey: .gameLink)
        self.stadium = try container.decodeIfPresent(Stadium.self, forKey: .stadium)
    }
}
