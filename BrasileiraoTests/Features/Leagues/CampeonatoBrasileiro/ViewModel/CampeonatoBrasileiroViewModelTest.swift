//
//  CampeonatoBrasileiroViewModelTest.swift
//  BrasileiraoTests
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import XCTest
@testable import Brasileirao

class CampeonatoBrasileiroViewModelTest: XCTestCase {

    override class func setUp() {
        super.setUp()
        RequestManager.instance.mockRequest()
    }

    override class func tearDown() {
        super.tearDown()
        RequestManager.instance.reset()
        MainManager.shared.reset()
    }

    func testCampeonatoBrasileiroViewModel() {
        MainManager.shared.campeonatoBrasileiroHelper.getCampeonatoBrasileiroInformation()
        guard let campeonatoBrasileiroViewModel = MainManager.shared.campeonatoBrasileiroHelper.campeonatoBrasileiroViewModel else {
            XCTFail("campeonatoBrasileiroViewModel is nil on helper")
            return
        }
        
        XCTAssertEqual(campeonatoBrasileiroViewModel.name, "Brasileirão 2020")
        XCTAssertEqual(campeonatoBrasileiroViewModel.status, "andamento")
        XCTAssertEqual(campeonatoBrasileiroViewModel.type, "pontos-corridos")
        XCTAssertEqual(campeonatoBrasileiroViewModel.season, "2020")
        XCTAssertEqual(campeonatoBrasileiroViewModel.matches?.count, 1)
    }

}
