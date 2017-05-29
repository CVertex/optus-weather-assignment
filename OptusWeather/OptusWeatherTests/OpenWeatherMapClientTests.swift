//
//  OpenWeatherMapClientTests.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 26/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import XCTest
@testable import OptusWeather

/// Simple tests for open weather map api client
/// NB: hits real API. In practice, I use Moya as a network abstraction layer
class OpenWeatherMapClientTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test3CitiesAreLoaded() {
        // Arrange
        let client = OpenWeatherMapApiClient()
        var result: Result<[CityWeatherApiModel], ApiError>? = nil
        let expect = expectation(description: "Fetching sydney, melb, bris")
        // Act
        client.fetchCitiesWeather() { r in
            result = r
            expect.fulfill()
        }
        // Assert
        waitForExpectations(timeout: 10) { err in
            switch result! {
            case let .success(cits):
                XCTAssertEqual(cits.count, 3)
                break
            case .failure:
                XCTFail("Shouldn't fail")
                break
            }
        }
    }
}
