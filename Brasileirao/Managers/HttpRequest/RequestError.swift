//
//  RequestErrors.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case emptyData
    case wrongPath
    case fileNotFound
    case unauthorized
    case invalidURL
    case badRequest
    case emptyURL
    case decodedError
    case serverError
    case serverUnavailable
    case unknown
    
    init(httpStatusCode: Int) {
        switch httpStatusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 404:
            self = .invalidURL
        case 500:
            self = .serverError
        case 503:
            self = .serverUnavailable
        default:
            self = .unauthorized
        }
    }
    
    var title: String {
        return "Error fetching Campeonato Brasileiro API"
    }
    
    var UIDescription: String {
        return "Something went wrong! \nWe are unable to retrieve your events at the moment."
    }
    
    var description: String {
        switch self {
        case .emptyData:
            return "Data is empty or nil"
        case .fileNotFound:
            return "Error file not found"
        case .decodedError:
            return "Error trying to decode data"
        case .unauthorized:
            return "Error trying to fetch data with unauthorized token"
        case .invalidURL:
            return "Error of invalid URL"
        case .emptyURL:
            return "Error of Empty or Nil URL"
        case .wrongPath:
            return "Error with the file path wrong"
        case .badRequest:
            return "Error of Bad Request"
        case .serverError:
            return "Error with Internal Server Error"
        case .serverUnavailable:
            return "Server is Unavailable"
        case .unknown:
            return self.localizedDescription
        }
    }
}
