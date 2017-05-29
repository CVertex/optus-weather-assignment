//
//  ViewModelPopulation.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 25/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
// swiftlint:disable function_body_length

import XCTest
@testable import OptusWeather


/// Tests creation of view model
class ViewModelPopulation: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCityViewModel() {
        // Arrange
        // Location
        let location = Location(latitude: 0.34,
                                 longitude: 34.0)
        // Sun
        let sun = Sun(sunrise: Date(timeIntervalSince1970: TimeInterval(1495609976)),
                       sunset: Date(timeIntervalSince1970: TimeInterval(1495609976)))
        // Temperature, Wind and Condition
        let temp = Temperature(value: 12.2323,
                               minimum: 10.12434,
                               maximum: 30.8374)
        let wind = Wind(speed: 23.34,
                        direction: 330)
        let cond = Condition(name: "condition",
                             description: "cloudy",
                             iconUrl: "http://openweathermap.org/img/w/12.png")
        // Weather
        let weather = Weather(temperature: temp,
                               condition: cond,
                               wind: wind,
                               pressure: 23.34,
                               humidity: 23.34,
                               cloudiness: 23.34,
                               rainVolume: 23.34,
                               visibility: 1000)

        let city = City(id: 100,
                        name: "Sydney",
                        country: "AU",
                        location: location,
                        weather: weather,
                        sun: sun)

        // Act
        let vm = CityViewModel(city: city)

        // Assert
        XCTAssert(vm.name == "Sydney")
        XCTAssert(vm.country == "AU")
        XCTAssert(vm.condition == "cloudy")
        XCTAssert(vm.conditionIconUrl == "http://openweathermap.org/img/w/12.png")
        XCTAssert(vm.cloudiness == "23%")
        XCTAssert(vm.humidity == "23%")
        XCTAssert(vm.pressure == "23hPa")
        XCTAssert(vm.rainVolume == "23mm")
        XCTAssert(vm.sunrise == "17:12")
        XCTAssert(vm.sunset == "17:12")
        XCTAssert(vm.temperature == "12.2°")
        XCTAssert(vm.temperatureMinimum == "10.1°")
        XCTAssert(vm.temperatureMaximum == "30.8°")
        XCTAssert(vm.visibility == "1,000m")
    }
}
