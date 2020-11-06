//
//  RequestManager.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

typealias CompletedRequest = (_ data: Data?, _ httpCode: BrasileiraoHttpCode?, _ error: NSError?) -> ()

final class RequestManager {
    static var sharedInstance = RequestManager()
    static var httpRequest = HttpRequest()
}
