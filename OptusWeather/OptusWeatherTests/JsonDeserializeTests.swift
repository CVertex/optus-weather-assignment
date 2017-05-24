//
//  JsonDeserializeTests.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import XCTest
@testable import OptusWeather

class JsonDeserializeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //{"coord":{"lon":144.96,"lat":-37.81},"sys":{"type":1,"id":8201,"message":0.015,"country":"AU","sunrise":1495574448,"sunset":1495609976},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"main":{"temp":15.68,"pressure":1017,"humidity":54,"temp_min":15,"temp_max":17},"visibility":10000,"wind":{"speed":3.6,"deg":330},"clouds":{"all":75},"dt":1495605563,"id":2158177,"name":"Melbourne"}
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
