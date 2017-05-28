//
//  CityHues.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 28/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

public struct CityHues {
    
    /// return a Hue (0 - 1.0) for a city name
    public static func hue(city:String) -> CGFloat {
        switch city {
        case "Sydney":
            return 0.4
        case "Brisbane":
            return 0.6
        case "Melbourne":
            return 0.8
        default:
            return 0.2
        }
        
    }
    
}
