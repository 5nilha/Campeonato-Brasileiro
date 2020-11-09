//
//  APIHandler.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class APIHandler {
    
    static func fetchAPIData(_ url: String?, endpoint: RequestEndpoints, completion: @escaping (Result<Data, RequestError>) -> ()) {
        guard let stringURL = url,
              let url = URL(string: "\(stringURL)\(endpoint)")
        else {
            let requestError = RequestError.wrongPath
            Logger.log(error: requestError)
            completion(.failure(requestError))
            return
        }

        let httpRequest = HttpRequest(url: url, endpoint: endpoint)
        RequestManager.instance.session(httpRequest: httpRequest) { (result) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let requestError):
                completion(.failure(requestError))
            }
        }
    }
}
