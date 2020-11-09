//
//  CampeonatoParser.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class CampeonatoParser {

    static func parser(data: Data?) -> CampeonatoBrasileiro? {
        guard let data = data else {
            let requestError = RequestError.emptyData
            Logger.log(error: requestError, info: "Error trying to parse a nil data")
            return nil }
        
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(CampeonatoBrasileiro.self, from: data)
            return object
        } catch {
            let requestError = error as? RequestError ?? RequestError.decodedError
            Logger.log(error: requestError, info: "Error parsing json - \(error.localizedDescription)")
            return nil
        }
    }
}
