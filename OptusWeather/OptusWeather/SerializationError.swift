//
//  SerializationError.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

public enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
