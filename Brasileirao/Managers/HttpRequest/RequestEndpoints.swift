//
//  RequestEndpoints.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

enum RequestEndpoints: String {
    case brasilianLeague = "campeonatos/10/fases/55"
    
    var url: String {
        switch self {
        case .brasilianLeague:
            return "https://api.api-futebol.com.br/v1/"
        }
    }
    
    var completePath: String {
        switch self {
        case .brasilianLeague:
            return "\(self.url)\(self.rawValue)"
        }
    }
    
    var mockJson: String {
        switch self {
        case .brasilianLeague:
            return "campeonato_brasileiro"
        }
        
    }
    
}
