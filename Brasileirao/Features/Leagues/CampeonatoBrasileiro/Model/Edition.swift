//
//  Edition.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class Edition: Decodable {
    public private (set) var id: Int?
    public private (set) var season: String?
    public private (set) var name: String?
    public private (set) var popularName: String?
    public private (set) var slug: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "edicao_id"
        case season = "temporada"
        case name = "nome"
        case popularName = "nome_popular"
        case slug = "slug"
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.season = try container.decodeIfPresent(String.self, forKey: .season)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.popularName = try container.decodeIfPresent(String.self, forKey: .popularName)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
    }
}
