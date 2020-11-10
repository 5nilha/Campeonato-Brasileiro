//
//  CampeonatoBrasileiroService.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

class CampeonatoBrasileiroService {
    
    func fetchLeagueData(completion: @escaping (Result<CampeonatoBrasileiro, RequestError>) -> ()) {
        APIHandler.fetchAPIData(endpoint: .brasilianLeague) { (result) in
            switch result {
            case .success(let data):
                guard let campeonatoBrasileiro = CampeonatoParser.parser(data: data) else {
                    completion(.failure(RequestError.decodedError))
                    return
                }
                completion(.success(campeonatoBrasileiro))
            case .failure(let error):
                //TODO: Handle the error
                break
            }
        }
    }
}
