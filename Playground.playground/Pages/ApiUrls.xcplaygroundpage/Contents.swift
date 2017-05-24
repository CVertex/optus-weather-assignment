//: [Previous](@previous)

import Foundation

/// API URL generator
public struct OpenWeatherMapApi {
    
    static let apiKey = "320a9792f0adcc484a65c9f448b61640"
    static let apiBase = "http://api.openweathermap.org/data/2.5"
    
    static let melbourneCityId = 2158177
    static let sydneyCityId = 2147714
    static let brisbaneCityId = 2174003
    
    public static func weatherForSydneyMelbourneAndBrisbane() -> String {
        return weatherForCities(ids: 2158177, 2147714, 2174003)
    }
    
    public static func weatherForCities(ids:Int64...) -> String {
        let idString = ids.map({"\($0)"}).joined(separator: ",")
        return "\(apiBase)/group?id=\(idString)&units=metric&appid=\(apiKey)"
    }
}

// Lets generate a URL
OpenWeatherMapApi.weatherForSydneyMelbourneAndBrisbane()
