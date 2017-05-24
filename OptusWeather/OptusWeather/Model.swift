//
//  CityWeatherModel.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Location
public struct Location {
    /// latitude
    let latitude:Double
    /// longitude
    let longitude:Double
}

// Temperature
public struct Temperature {
    
    /// Temperature in Celcius
    let value:Float
    /// Min temperature in Celcius
    let minimum:Float
    /// Max temperature in Celcius
    let maximum:Float
}

/// Condition summary
public struct Condition {
    /// Name (Rain, Snow, Extreme etc.)
    let name:String
    /// Description
    let description:String
    /// Icon URL
    let iconUrl:String
}

/// Wind details
public struct Wind {
    /// Wind speed in m/s
    let speed:Float
    /// Wind direction, degrees (meteorological)
    let direction: Float
}

/// Weather info
public struct Weather {
    /// Temperature
    let temperature:Temperature
    /// Condition
    let condition:Condition
    /// Wind
    let wind: Wind
    /// Pressure in hPa
    let pressure : Float
    /// Humidity in %
    let humidity : Float
    /// % Cloudiness
    let cloudiness: Float
    /// Rain Volume (unknown units) in last 3h
    let rainVolume: Float
    /// Visibility in meters
    let visibility:Int64
}

public struct Sun {
    /// Time of Sunrise in local time
    let sunrise: Date
    /// Time of Sunset in local time
    let sunset: Date
}

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
        let cond = Condition(name: model.weatherConditionName,
                             description: model.weatherConditionDescription,
                             iconUrl: "http://openweathermap.org/img/w/\(model.weatherConditionIcon).png")
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
