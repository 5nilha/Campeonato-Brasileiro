//
//  SessionManager.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

class SessionManager {
    var instance = SessionManager()
    private var sessionTask: URLSessionDataTask?
    
    func startSession(httpRequest: HttpRequest, completion: @escaping (Result<Data, RequestError>) -> ()) {
        sessionTask = URLSession.shared.dataTask(with: httpRequest.request) { (data, response, error) in
            if let error = error {
                Logger.log(error: error as? RequestError, info: "Error fetching API Data")
                Utils.instance.showErrorAlert(title: RequestError.wrongPath.title, body: RequestError.wrongPath.description)
                completion(.failure(RequestError.invalidURL))
                return
            }
            guard let data = data, let response = response else {
                Logger.log(error: error as? RequestError, info: "Error fetching API Data")
                Utils.instance.showErrorAlert(title: RequestError.wrongPath.title, body: RequestError.wrongPath.description)
                completion(.failure(RequestError.unknown))
                return
            }
            Logger.debugServiceSuccess(info: "Data fetched from API", response: "200", data: data)
            completion(.success(data))
        }
        
        sessionTask?.resume()
        
    }
    
    func cancelSession() {
        sessionTask?.cancel()
    }
    
    func stopSession() {
        sessionTask?.suspend()
    }
    
    func resumeSession() {
        sessionTask?.resume()
    }
}
