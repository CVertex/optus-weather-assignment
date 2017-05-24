//
//  Result.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Result<T,TError> for nicer callbacks
public enum Result<T, TError> where TError:Error {
    case success(T)
    case failure(TError)
}
