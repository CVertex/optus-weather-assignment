//
//  LoadingBackgroundView.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 27/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
import UIKit
import QuartzCore

@IBDesignable public class OverlayBackgroundView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
