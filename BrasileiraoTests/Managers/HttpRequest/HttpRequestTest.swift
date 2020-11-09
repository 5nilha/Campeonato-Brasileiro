//
//  HttpRequestTest.swift
//  BrasileiraoTests
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import XCTest
@testable import Brasileirao

class HttpRequestTest: XCTestCase {

    func testHttpRequestForCampeonatoBrasileiro() {
        guard let url =  URL(string: "https://api.api-futebol.com.br/v1/campeonatos/10/fases/55") else {
            XCTFail("URL error")
            return
        }
        let httpRequest = HttpRequest(url: url, endpoint: .brasilianLeague)
        XCTAssertNotNil(httpRequest.url)
        XCTAssertNotNil(httpRequest.endpoint)
        XCTAssertEqual(httpRequest.request.url, url)
    }

}
