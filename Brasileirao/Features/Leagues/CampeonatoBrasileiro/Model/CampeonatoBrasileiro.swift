//
//  CampeonatoBrasileiro.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class CampeonatoBrasileiro: Decodable {
    public private (set) var id: Int?
    public private (set) var name: String?
    public private (set) var slug: String?
    public private (set) var status: String?
    public private (set) var type: String?
    public private (set) var twoLegsGame: Bool?
    public private (set) var table: [Table]?
    public private (set) var edition: Edition?
    public private (set) var matches: [String: [Match]]?
    
    enum CodingKeys: String, CodingKey {
        case id = "fase_id"
        case name = "nome"
        case slug = "slug"
        case status = "status"
        case type = "tipo"
        case twoLegsGame = "ida_e_volta"
        case table = "tabela"
        case edition = "edicao"
        case matches = "partidas"
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.twoLegsGame = try container.decodeIfPresent(Bool.self, forKey: .twoLegsGame)
        self.table = try container.decodeIfPresent([Table].self, forKey: .table)
        self.edition = try container.decodeIfPresent(Edition.self, forKey: .edition)
        self.matches = try container.decodeIfPresent([String: [Match]].self, forKey: .matches)
    }
}

