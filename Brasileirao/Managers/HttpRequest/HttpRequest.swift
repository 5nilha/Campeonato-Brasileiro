//
//  HttpRequest.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class HttpRequest {
    private var url: URL!
    internal private (set) var request: URLRequest
    
    init(url: URL) {
        self.url = url
        self.request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
