//
//  TeamViewModel.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

struct TeamViewModel {
   
    private let team: Team
    
    init(team: Team) {
        self.team = team
    }
    
    var name: String? {
        return team.name
    }
}
