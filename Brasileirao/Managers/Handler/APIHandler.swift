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
    
    final func fetchAPIData(completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = url
        else {
            //TODO: Add Log Error
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //TODO: Starting Section Here
    }
    
}
