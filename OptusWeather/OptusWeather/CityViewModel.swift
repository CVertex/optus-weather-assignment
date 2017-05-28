//
//  CityViewModel.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 25/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

public struct CityViewModel {
    /// City Name
    let name: String
    /// City country code
    let country: String
    /// City Hue (0.0 - 1.0)
    let hue: CGFloat
    /// Temperature (celcius) e.g. 27.9°
    let temperature: String
    /// Temperature, min (celcius) e.g. 27.9°
    let temperatureMinimum: String
    /// Temperature, max (celcius)
    let temperatureMaximum: String
    /// Condition, a description of the weather condition. e.g. cloudy with rain
    let condition: String
    /// URL of an icon visualizing the condition. e.g. http://blah.com/ICO.png
    let conditionIconUrl: String
    /// Time of sunrise e.g. 8:30
    let sunrise: String
    /// Time of sunset e.g. 17:30
    let sunset: String
    /// Pressure in hPa e.g. 1000hPa
    let pressure: String
    /// Humidity in % e.g. 30%
    let humidity: String
    /// % Cloudiness. e.g. 12%
    let cloudiness: String
    /// Rain Volume (millimeters). e.g 3mm
    let rainVolume: String
    /// Visibility in meters e.g. 10,000m
    let visibility: String
}

public extension CityViewModel {
    public init(city: City) {
        self.name = city.name
        self.country = city.country
        self.temperature = Formatters.tempToString(value: city.weather.temperature.value)
        self.temperatureMinimum = Formatters.tempToString(value: city.weather.temperature.minimum)
        self.temperatureMaximum = Formatters.tempToString(value: city.weather.temperature.maximum)
        self.sunrise = Formatters.sunTime.string(from: city.sun.sunrise)
        self.sunset = Formatters.sunTime.string(from: city.sun.sunset)
        self.condition = city.weather.condition.description
        self.conditionIconUrl = city.weather.condition.iconUrl
        self.visibility = Formatters.distanceToString(meters: Float(city.weather.visibility))
        self.pressure = Formatters.pressureToString(value: city.weather.pressure)
        self.humidity = Formatters.percentageToString(value: city.weather.humidity)
        self.cloudiness = Formatters.percentageToString(value: city.weather.cloudiness)
        self.rainVolume = Formatters.rainVolumeToString(value: city.weather.rainVolume)
        self.hue = CityHues.hue(city: city.name)
    }
}
