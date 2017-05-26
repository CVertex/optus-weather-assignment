//: [Previous](@previous)

import Foundation

// Sunset and sunrise formatting
var date = Date()
// HH:mm
let formatter = DateFormatter()
formatter.dateFormat = "HH:mm"
formatter.string(from: date)


// Temp formatting
let temp = 78.9343
let nf = NumberFormatter()
nf.numberStyle = .decimal
nf.maximumFractionDigits = 1
// 78.9
nf.string(from: NSNumber(value: temp))

// Distance
let dist = 10000
let distf = NumberFormatter()
distf.numberStyle = .decimal
distf.string(from: NSNumber(value:dist))

// Pressure
let pressure = 12.98
let pf = NumberFormatter()
pf.numberStyle = .decimal
pf.maximumFractionDigits = 0
pf.string(from: NSNumber(value:pressure))
