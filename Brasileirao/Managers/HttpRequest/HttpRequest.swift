//
//  HttpRequest.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class HttpRequest {
    internal private (set) var request: URLRequest
    internal private (set) var url: URL?
    internal private (set) var endpoint: RequestEndpoints?
    
    init(url: URL, endpoint: RequestEndpoints) {
        self.url = url
        self.endpoint = endpoint
        self.request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer live_82513414ae191e89844a7fb9a6f0ea", forHTTPHeaderField: "Authorization")
    }
}
