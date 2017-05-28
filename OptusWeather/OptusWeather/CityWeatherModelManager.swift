//
//  CityWeatherModelManager.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Manager for the City Weather domain
/// A facade into the model layer
public class CityWeatherModelManager {

    let apiClient: ApiClient

    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    public func loadCities(callback: @escaping (Result<[City], ApiError>) -> Void) {
        // Pass through to API Client, map results
        apiClient.fetchCitiesWeather { result in
            switch result {
            case let .failure(error):
                callback(.failure(error))
                break
            case let .success(items):
                callback(.success(items.map(City.init)))
                break
            }
        }
    }
}
