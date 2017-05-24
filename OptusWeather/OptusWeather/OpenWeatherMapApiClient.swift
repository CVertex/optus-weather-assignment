//
//  OpenWeatherMapApiClient.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// API Client using OpenWeatherMap web service
public class OpenWeatherMapApiClient : ApiClient {
    
    public static func fetchCitiesWeather(callback:  @escaping CityWeatherCallback) {
        let urlString = OpenWeatherMapApi.weatherForSydneyMelbourneAndBrisbane()
        let url = URL(string: urlString)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if error != nil {
                // Network problem
                callback(.failure(.network))
            } else if let data = data {
                // We have data, let's try process it!
                do {
                    let details = try OpenWeatherMapApiClient.decodeCitiesWeather(data: data)
                    callback(.success(details))
                } catch {
                    callback(.failure(.decoding))
                }
            }
        }
        dataTask.resume()
    }
    
    /// Decode data into API model
    public static func decodeCitiesWeather(data:Data) throws -> [CityWeatherApiModel] {
        let jsonRoot = try JSONSerialization.jsonObject(with: data)
        let json = jsonRoot as? [String:Any]
        if let j = json {
            // Convert the JSON array into list of CityWeathers
            var models = [CityWeatherApiModel]
            guard let list = j["list"] as? [[String:Any]] else {
                throw ApiError.decoding
            }
            
            for item in list {
                let m = try CityWeatherApiModel(json: item)
                models.append(m)
            }
            
            return models
        } else {
            throw ApiError.decoding
        }
    }
}

