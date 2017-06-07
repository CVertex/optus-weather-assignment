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
    public struct Temp {
        public static func string(from value: Float) -> String {
            return "\(formatter.string(from: NSNumber(value:value))!)°"
        }

        public static let formatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.maximumFractionDigits = 1
            return nf
        }()
    }

    // MARK: Distance
    public struct Distance {
        public static func string(from meters: Float) -> String {
            return "\(formatter.string(from: NSNumber(value:meters))!)m"
        }

        public static let formatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            return f
        }()
    }

    // MARK: Percentage
    public struct Percentage {
        public static func string(from value: Float) -> String {
            return "\(formatter.string(from: NSNumber(value:value))!)%"
        }

        public static let formatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            f.maximumFractionDigits = 0
            return f
        }()
    }

    // MARK: Rain Volume
    public struct RainVolume {
        public static func string(from value: Float) -> String {
            return "\(Percentage.formatter.string(from: NSNumber(value:value))!)mm"
        }
    }

    // MARK: Pressure
    public struct Pressure {
        public static func string(from value: Float) -> String {
            return "\(formatter.string(from: NSNumber(value:value))!)hPa"
        }

        public static let formatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            f.maximumFractionDigits = 0
            return f
        }()
    }
}
