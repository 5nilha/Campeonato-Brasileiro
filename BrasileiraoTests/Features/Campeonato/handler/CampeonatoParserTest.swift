//
//  CampeonatoParserTest.swift
//  BrasileiraoTests
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import XCTest
@testable import Brasileirao

class CampeonatoParserTest: XCTestCase {

    override class func setUp() {
        super.setUp()
        RequestManager.instance.mockRequest()
    }

    override class func tearDown() {
        super.tearDown()
        RequestManager.instance.reset()
    }

    func testCampeonatoParser() {
        APIHandler.fetchAPIData("", endpoint: .brasilianLeague) { (result) in
            switch result {
            case .success(let data):
                guard let campeonatoBrasileiro = CampeonatoParser.parser(data: data) else {
                    XCTFail("Error Parsing Data")
                    return
                }
                XCTAssertNotNil(campeonatoBrasileiro)
                XCTAssertEqual(campeonatoBrasileiro.id, 55)
                XCTAssertEqual(campeonatoBrasileiro.name, "Fase Única")
                XCTAssertEqual(campeonatoBrasileiro.status, "andamento")
                XCTAssertEqual(campeonatoBrasileiro.type, "pontos-corridos")
            case .failure(_):
                XCTFail("Nil Data")
            }
        }
    }

}
