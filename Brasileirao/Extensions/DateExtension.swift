//
//  DateExtension.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/10/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

extension Date {
    
    static var timezone: TimeZone {
        return TimeZone(abbreviation: "UTC") ?? TimeZone.current
    }
    
    static func dateFromISOString(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.languageCode ?? "pt_BR")
        dateFormatter.timeZone = TimeZone(abbreviation: "BRT")
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        return dateFormatter.date(from: string)
    }
    
    var formattedDateString : String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Date.timezone
        dateFormatter.locale = Locale(identifier: Locale.current.languageCode ?? "en")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let stringDate = dateFormatter.string(from: self)
        return stringDate
    }
    
    var formattedTimeWithoutSeconds: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Date.timezone
        dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "h:mm a"
        let date12 = dateFormatter.string(from: self)
        return date12
    }
}
