//
//  RequestErrors.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case wrongPath
    case invalidURL
    case decodedError
    case unknown
    
    var title: String {
        return "Error fetching Campeonato Brasileiro API"
    }
    
    var UIDescription: String {
        return "Something went wrong! \nWe are unable to retrieve your events at the moment."
    }
    
    var description: String {
        switch self {
        case .decodedError:
            return "Error trying to decode data"
        case .invalidURL:
            return "Error of invalid url"
        case .wrongPath:
            return "Error with the file path wrong"
        case .unknown:
            return self.localizedDescription
        }
    }
}
