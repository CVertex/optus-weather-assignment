//
//  UINavigationControllerRotation.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 28/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

// Disable rotation
extension UINavigationController {

    open override var shouldAutorotate: Bool {
        return false
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}
