//
//  JsonDeserializeTests.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
// swiftlint:disable force_try
// swiftlint:disable force_cast

import XCTest
@testable import OptusWeather

class JsonDeserializeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCityWeatherApiModel() {
        // Arrange
        let json = loadJsonFile(fileName: "melb_weather")
        let source = parseJson(json: json)
        // Act
        let model = try! CityWeatherApiModel(json:source)
        // Assert
        XCTAssert(model.name == "Melbourne")
        XCTAssert(model.id == 2158177)
        XCTAssert(model.country == "AU")
        XCTAssert(model.latitude == -37.81)
        XCTAssert(model.longitude == 144.96)
        XCTAssert(model.temperature == 15.68)
        XCTAssert(model.temperatureMinimum == 15)
        XCTAssert(model.temperatureMaximum == 17)
        XCTAssert(model.pressure == 1017)
        XCTAssert(model.humidity == 54)
        XCTAssert(model.cloudiness == 75)
        XCTAssert(model.rainVolume == 0)
        XCTAssert(model.windSpeed == 3.6)
        XCTAssert(model.windDirection == 330)
        XCTAssert(model.visibility == 10000)
        XCTAssert(model.sunset == 1495609976)
        XCTAssert(model.sunrise == 1495574448)
        XCTAssert(model.weatherConditionName == "Clouds")
        XCTAssert(model.weatherConditionDescription == "broken clouds")
        XCTAssert(model.weatherConditionIcon == "04d")
    }
}
