//
//  SessionManager.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

class SessionManager {
    static var instance = SessionManager()
    private var sessionTask: URLSessionDataTask?
    
    func session(httpRequest: HttpRequest, completion: @escaping (Result<Data, RequestError>) -> ()) {
        if sessionTask != nil {
            cancelSession()
        }
        sessionTask = URLSession.shared.dataTask(with: httpRequest.request) { [weak self] (data, response, error) in
            if let error = error {
                Logger.log(error: error as? RequestError, info: "Error fetching API Data")
                Utils.instance.showErrorAlert(title: RequestError.wrongPath.title, body: RequestError.wrongPath.description)
                completion(.failure(RequestError.invalidURL))
                return
            }
            guard let response = response, let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(RequestError.unknown))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode), let data = data else {
                let requestError = RequestError(httpStatusCode: httpResponse.statusCode)
                Logger.log(error: requestError, info: "\(httpResponse.statusCode) Error fetching API Data")
                DispatchQueue.main.async {
                    Utils.instance.showErrorAlert(title: requestError.title, body: RequestError.wrongPath.description)
                }
                
                completion(.failure(requestError))
                return
            }
            
            Logger.debugServiceSuccess(info: "Data fetched from API", httpCode: BrasileiraoHttpCode.ok, response: response, data: data)
            completion(.success(data))
            self?.stopSession()
        }
        resumeSession()
    }
    
    func resumeSession() {
        sessionTask?.resume()
    }
    
    func cancelSession() {
        sessionTask?.cancel()
    }
    
    func stopSession() {
        sessionTask?.suspend()
    }
    
}
