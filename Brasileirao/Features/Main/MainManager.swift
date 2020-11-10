//
//  MainManager.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import Foundation

final class MainManager {
    
    static private (set) var shared = MainManager()
    lazy var campeonatoBrasileiroHelper = CampeonatoBrasileiroHelper()
    
    init(){}
    
    func reset() {
        campeonatoBrasileiroHelper = CampeonatoBrasileiroHelper()
    }
}
