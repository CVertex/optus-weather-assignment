//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)

let c = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let h = UIColor(hue: 0.5, saturation: 1.0, brightness: 1.0, alpha: 1.0)

func col(sat:CGFloat) -> UIColor {
    return UIColor(hue: 0.5, saturation: sat, brightness: 1.0, alpha: 1.0)
}


print("------")
col(sat: 0.25)
col(sat: 0.20)
col(sat: 0.15)
col(sat: 0.10)
col(sat: 0.05)
col(sat: 0.0)


