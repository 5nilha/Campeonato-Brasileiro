//
//  RequestManager.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

enum RequestTypes {
    case mock
}

class RequestManager {
    static public private (set) var instance = RequestManager()
    var requestType: RequestTypes?
    
    init(){}
    
    func reset() {
        RequestManager.instance = RequestManager()
    }
    
    func mockRequest() {
        requestType = .mock
    }
    
    func session(httpRequest: HttpRequest, completion: @escaping (Result<Data, RequestError>) -> ()) {
        if requestType != .mock {
            SessionManager.instance.startSession(httpRequest: httpRequest) { (result) in
                completion(result)
            }
        } else {
            //Use the Mock jason to mimic the API response data
            if let path = Bundle.main.path(forResource: httpRequest.endpoint?.mockJson, ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                     completion(.success(data))
                  } catch {
                    Logger.log(error: .fileNotFound)
                    completion(.failure(.fileNotFound))
                  }
            } else {
                Logger.log(error: .wrongPath)
                completion(.failure(.wrongPath))
            }
        }
        
    }
    
}
