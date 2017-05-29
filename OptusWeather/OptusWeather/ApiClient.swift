//
//  ApiClient.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

public typealias CityWeatherCallback = (Result<[CityWeatherApiModel], ApiError>) -> Void

// API Error
public enum ApiError: Error {
    case network
    case decoding
}

// API Client Contract
public protocol ApiClient {
    func fetchCitiesWeather(callback:  @escaping CityWeatherCallback)
}
