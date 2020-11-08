//
//  Logger.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/6/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

class Logger {
    
    class func log(error: RequestError?, info: String? = nil) {
        let errorDescription = error?.description
        let errorTitle = error?.title
        let errorTimestamp = Date().timeIntervalSince1970
        
        let errorLog = [
            errorTimestamp: [
                "title" : errorTitle ?? "",
                "description" : errorDescription ?? "",
                "errorDate" : errorTimestamp,
                "errorInfo" : info ?? ""
            ]]
        
        print(errorLog)
    }
    
    class func debugServiceSuccess(info: String, response: String, data: Any) {
        print("========================= Debugging =============================")
        print("Information = \(info)")
        print("Response = \(response)")
        print("Data = \(data)")
        print("=================================================================")
    }
}
