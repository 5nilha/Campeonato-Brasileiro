//
//  Team.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class Team: Decodable {
    public private (set) var id: Int?
    public private (set) var name: String?
    public private (set) var escudo: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "time_id"
        case name = "nome_popular"
        case escudo = "escudo"
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.escudo = try container.decodeIfPresent(String.self, forKey: .escudo)
    }
}
