//
//  EditionViewModel.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

struct EditionViewModel {
    private let edition: Edition
    
    init(edition: Edition) {
        self.edition = edition
    }
    
    var season: String? {
        return edition.season
    }
    
    var name: String? {
        return edition.popularName
    }
}
