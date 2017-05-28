//
//  Weather.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Weather info
public struct Weather {
    /// Temperature
    let temperature: Temperature
    /// Condition
    let condition: Condition
    /// Wind
    let wind: Wind
    /// Pressure in hPa
    let pressure: Float
    /// Humidity in %
    let humidity: Float
    /// % Cloudiness
    let cloudiness: Float
    /// Rain Volume (unknown units) in last 3h
    let rainVolume: Float
    /// Visibility in meters
    let visibility: Int64
}
