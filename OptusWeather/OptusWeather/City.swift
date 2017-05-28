//
//  CityWeatherModel.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
// swiftlint:disable variable_name line_length
import Foundation

/// City with weather, location and sun details
public struct City {
    /// City ID
    let id: Int64
    /// City Name
    let name: String
    /// City country code
    let country: String
    /// Location
    let location: Location
    /// Weather
    let weather: Weather
    /// Sunset/Rise info
    let sun: Sun
}


public extension City {

    public init(model: CityWeatherApiModel) {
        self.id = model.id
        self.name = model.name
        self.country = model.country
        // Location
        self.location = Location(latitude: model.latitude,
                                 longitude: model.longitude)
        // Sun
        self.sun = Sun(sunrise: Date(timeIntervalSince1970: TimeInterval(model.sunrise)),
                       sunset: Date(timeIntervalSince1970: TimeInterval(model.sunset)))
        // Temperature, Wind and Condition
        let temp = Temperature(value: model.temperature,
                               minimum: model.temperatureMinimum,
                               maximum: model.temperatureMaximum)
        let wind = Wind(speed: model.windSpeed,
                        direction: model.windDirection)
        let iconUrl = "http://openweathermap.org/img/w/\(model.weatherConditionIcon).png"
        let cond = Condition(name: model.weatherConditionName,
                             description: model.weatherConditionDescription,
                             iconUrl: iconUrl)
        // Weather
        self.weather = Weather(temperature: temp,
                               condition: cond,
                               wind: wind,
                               pressure: model.pressure,
                               humidity: model.humidity,
                               cloudiness: model.cloudiness,
                               rainVolume: model.rainVolume,
                               visibility: model.visibility)
    }
}
