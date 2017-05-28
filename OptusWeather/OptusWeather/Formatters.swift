//
//  Formatters.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 25/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

public struct Formatters {
    /// TimeZone for formatting
    public static let timeZone: TimeZone = {
       return TimeZone.current
    }()

    // MARK: Sunrise/Sunset
    public static let sunTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = timeZone
        return formatter
    }()

    // MARK: Temperature
    public static func tempToString(value: Float) -> String {
        return "\(temperature.string(from: NSNumber(value:value))!)°"
    }

    public static let temperature: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 1
        return nf
    }()

    // MARK: Distance
    public static func distanceToString(meters: Float) -> String {
        return "\(distance.string(from: NSNumber(value:meters))!)m"
    }

    public static let distance: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()

    // MARK: Percentage
    public static func percentageToString(value: Float) -> String {
        return "\(percentage.string(from: NSNumber(value:value))!)%"
    }

    public static let percentage: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.maximumFractionDigits = 0
        return f
    }()

    public static func rainVolumeToString(value: Float) -> String {
        return "\(percentage.string(from: NSNumber(value:value))!)mm"
    }

    // MARK: Pressure
    public static func pressureToString(value: Float) -> String {
        return "\(pressure.string(from: NSNumber(value:value))!)hPa"
    }

    public static let pressure: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.maximumFractionDigits = 0
        return f
    }()
}
