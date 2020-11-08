//
//  APIHandler.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class APIHandler {
    
    private var url: URL!
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        print("API Handler Deinitialized")
    }
    
    final func fetchAPIData(completion: @escaping (Result<Data, RequestError>) -> ()) {
        guard let url = url
        else {
            Logger.log(error: .emptyURL)
            return
        }

        let httpRequest = HttpRequest(url: url)
        SessionManager.instance.session(httpRequest: httpRequest) { (result) in
            completion(result)
        }
    }
}
