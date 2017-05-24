//
//  CityWeather.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Flattened API model of a city weather
public struct CityWeatherApiModel {
    /// City ID
    let id:Int64
    /// City Name
    let name:String
    /// City country code
    let country:String
    /// City latitude
    let latitude:Double
    /// City longitude
    let longitude:Double
    
    /// Temperature in Celcius
    let temperature:Float
    /// Min temperature in Celcius
    let temperatureMinimum:Float
    /// Max temperature in Celcius
    let temperatureMaximum:Float
    /// Pressure in hPa
    let pressure : Float
    /// Humidity in %
    let humidity : Float
    /// % Cloudiness
    let cloudiness: Float
    /// Rain Volume in last 3h
    let rainVolume: Float
    /// Wind speed in m/s
    let windSpeed:Float
    /// Wind direction, degrees (meteorological)
    let windDirection: Float
    /// Visibility in meters
    let visibility:Int64
    
    /// Time of Sunrise in unix time
    let sunrise:Int64
    /// Time of Sunset in unix time
    let sunset:Int64

    /// Weather condition name (Rain, Snow, Extreme etc.)
    let weatherConditionName:String
    /// Weather condition description
    let weatherConditionDescription:String
    /// Weather condition icon code
    let weatherConditionIcon:String
}

public extension CityWeatherApiModel {
    public init(json: [String: Any]) throws {
        // Extract properties
        guard let name = json["name"] as? String else {
            throw SerializationError.missing("name")
        }
        guard let id = json["id"] as? Int64 else {
            throw SerializationError.missing("id")
        }
        guard let coord = json["coord"] as? [String:Any] else {
            throw SerializationError.missing("coord")
        }
        guard let sys = json["sys"] as? [String:Any] else {
            throw SerializationError.missing("sys")
        }
        guard let clouds = json["clouds"] as? [String:Any] else {
            throw SerializationError.missing("clouds")
        }
        guard let weatherArray = json["weather"] as? [Any] else {
            throw SerializationError.missing("weather")
        }
        guard let vis = json["visibility"] as? Int64 else {
            throw SerializationError.missing("visibility")
        }
        guard let wind = json["wind"] as? [String:Any] else {
            throw SerializationError.missing("wind")
        }
        guard let main = json["main"] as? [String:Any] else {
            throw SerializationError.missing("main")
        }
        let rain = json["rain"] as? [String:Any]
        
        
        // Coord
        guard let latitude = coord["lat"] as? Double else {
            throw SerializationError.missing("coord.lat")
        }
        guard let longitude = coord["lon"] as? Double else {
            throw SerializationError.missing("coord.lon")
        }
    
        // Sys
        guard let country = sys["country"] as? String else {
            throw SerializationError.missing("sys.country")
        }
        guard let sunrise = sys["sunrise"] as? Int64 else {
            throw SerializationError.missing("sys.sunrise")
        }
        guard let sunset = sys["sunset"] as? Int64 else {
            throw SerializationError.missing("sys.sunset")
        }
        
        // Clouds
        guard let cloudiness = clouds["all"] as? Float else {
            throw SerializationError.missing("clouds.cloudiness")
        }
        
        // Weather
        if weatherArray.count < 1 {
            throw SerializationError.missing("weather")
        }
        guard let weather = weatherArray[0] as? [String:Any] else {
            throw SerializationError.missing("weather[0]")
        }
        guard let condName = weather["main"] as? String else {
            throw SerializationError.missing("weather.main")
        }
        guard let condDesc = weather["description"] as? String else {
            throw SerializationError.missing("weather.description")
        }
        guard let condIcon = weather["icon"] as? String else {
            throw SerializationError.missing("weather.icon")
        }
        
        // Wind
        guard let windSpeed = wind["speed"] as? Float else {
            throw SerializationError.missing("wind.speed")
        }
        guard let windDir = wind["deg"] as? Float else {
            throw SerializationError.missing("wind.deg")
        }
        
        // Rain
        var rainVolume:Float = 0.0
        if let r = rain {
            rainVolume = (r["3h"] as? Float) ?? 0.0
        }
        
        // Main
        guard let temp = main["temp"] as? Float else {
            throw SerializationError.missing("main.temp")
        }
        guard let tempMin = main["temp_min"] as? Float else {
            throw SerializationError.missing("main.temp_min")
        }
        guard let tempMax = main["temp_max"] as? Float else {
            throw SerializationError.missing("main.temp_max")
        }
        guard let pressure = main["pressure"] as? Float else {
            throw SerializationError.missing("main.pressure")
        }
        guard let humidity = main["humidity"] as? Float else {
            throw SerializationError.missing("main.humidity")
        }
        
        // Init properties
        self.name = name
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.country = country
        self.sunset = sunset
        self.sunrise = sunrise
        self.cloudiness = cloudiness
        self.weatherConditionName = condName
        self.weatherConditionDescription = condDesc
        self.weatherConditionIcon = condIcon
        self.visibility = vis
        self.windSpeed = windSpeed
        self.windDirection = windDir
        self.humidity = humidity
        self.pressure = pressure
        self.temperature = temp
        self.temperatureMinimum = tempMin
        self.temperatureMaximum = tempMax
        self.rainVolume = rainVolume
    }
}
