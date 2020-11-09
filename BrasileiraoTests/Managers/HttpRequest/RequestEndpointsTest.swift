//
//  RequestEndpointsTest.swift
//  BrasileiraoTests
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import XCTest
@testable import Brasileirao
class RequestEndpointsTest: XCTestCase {

    func testCampeonatoBrasileiroEndpoint() {
        XCTAssertEqual(RequestEndpoints.brasilianLeague.rawValue, "campeonatos/10/fases/55")
        XCTAssertEqual(RequestEndpoints.brasilianLeague.mockJson, "campeonato_brasileiro")
    }
}
