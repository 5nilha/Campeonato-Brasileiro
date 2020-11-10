//
//  APIHandler.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

final class APIHandler {
    
    static func fetchAPIData(endpoint: RequestEndpoints, completion: @escaping (Result<Data, RequestError>) -> ()) {
        guard let url = URL(string: endpoint.completePath)
        else {
            let requestError = RequestError.wrongPath
            Logger.log(error: requestError, info: "Error trying to fetch Data from URL: \(endpoint.completePath)")
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
    
    static func fetchImage(_ string: String?, completion: @escaping (UIImage?) -> ()) {
        guard let stringURL = string,
              let url = URL(string: stringURL)
        else {
            let requestError = RequestError.wrongPath
            Logger.log(error: requestError, info: "Error trying to fetch image with url: \(String(describing: string))")
            completion(nil)
            return
        }
        
        //Checks if image exists in the App cache
        if let image = Cache.images.object(forKey: NSString(string: stringURL)) {
            completion(image)
        } else {
            RequestManager.instance.downloadImage(imageURL: url) { (result) in
                switch result {
                case .success(let image):
                    completion(image)
                case .failure(_):
                    completion(nil)
                }
            }
        }
    }
}
