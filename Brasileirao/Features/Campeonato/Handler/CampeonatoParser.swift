//
//  CampeonatoParser.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class CampeonatoParser {
    init(){}
    
    deinit {
        print("Dataparser deinitiated")
    }
    
    final func parser(data: Data?) -> Any? {
        guard let data = data else {
            let requestError = RequestError.emptyData
            Logger.log(error: requestError, info: "Error trying to parse a nil data")
            return nil }
        
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(CampeonatoBrasileiro.self, from: data)
            return jsonData
        } catch {
            let requestError = error as? RequestError ?? RequestError.decodedError
            Logger.log(error: requestError, info: "Error parsing json")
            return nil
        }
    }
}
