//
//  DebugOverlay.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 31/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//
import UIKit

/// Manager for Apple's private Debugging Overlay
public class DebugOverlay {
    /// Singleton
    public static let shared = DebugOverlay()

    // Overlay
    var overlayClass: UIWindow.Type? = nil

    /// Prepares a private iOS debugging overlay
    /// See http://ryanipete.com/blog/ios/swift/objective-c/uidebugginginformationoverlay/
    /// Call on app boot
    public func prepare() {
        overlayClass = NSClassFromString("UIDebuggingInformationOverlay") as? UIWindow.Type
        _ = overlayClass?.perform(NSSelectorFromString("prepareDebuggingOverlay"))
    }

    /// Toggle overlay visiblity
    public func toggle() {
        let overlaySel = NSSelectorFromString("overlay")
        let overlay = overlayClass?.perform(overlaySel).takeUnretainedValue() as? UIWindow
        _ = overlay?.perform(NSSelectorFromString("toggleVisibility"))
    }
}
