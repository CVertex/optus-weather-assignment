//
//  LayoutHelper.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 7/06/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

public class LayoutHelper {

    /// Fill a view to the margins and center it
    public static func fillAndCentre(_ view: UIView, margins: UILayoutGuide) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}
