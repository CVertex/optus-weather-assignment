//
//  Helpers.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
// swiftlint:disable force_try
// swiftlint:disable force_cast
import Foundation
@testable import OptusWeather

/// Parse JSON into dictionary
func parseJson(json: String) -> [String:Any] {
    let jsonData = json.data(using: .utf8)!
    let jsonRoot = try! JSONSerialization.jsonObject(with: jsonData)
    return jsonRoot as! [String:Any]
}

/// Load JSON file from test bundle
func loadJsonFile(fileName: String) -> String {
    let bundle = Bundle(for: JsonDeserializeTests.self)
    let jsonFile = bundle.path(forResource: fileName, ofType: "json")!
    let jsonString = try! String(contentsOfFile: jsonFile, encoding: .utf8)
    return jsonString
}


/// Load cities weather file
func loadCitiesApiModel() -> [CityWeatherApiModel] {
    let json = loadJsonFile(fileName: "cities_weather")
    return try! OpenWeatherMapApiClient.decodeCitiesWeather(data:json.data(using: .utf8)!)
}

/// Create some sample cities
fileprivate func makeFakeCity() -> City {
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
    return city
}

func makeFakeCities(count: Int) -> [City] {
    var cities = [City]()
    for _ in 0...count {
        cities.append(makeFakeCity())
    }
    return cities
}
