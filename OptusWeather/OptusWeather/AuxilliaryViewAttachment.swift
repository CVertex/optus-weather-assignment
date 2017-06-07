//
//  AuxilliaryViewAttachment.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 7/06/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

// AuxilliaryViewAttachment
extension UIViewController {

    /// Create, attach, layout and auxillary views, LoadingView and ErrorView
    public func attachAuxilliaryViews() -> (loading: LoadingView, error: ErrorView) {
        guard let nc = navigationController else {
            fatalError("UIViewController must belong to a UINavigationController")
        }
        let margins = nc.view.layoutMarginsGuide
        // Loading View
        let lv = LoadingView.create()
        nc.view.addSubview(lv)
        nc.view.bringSubview(toFront: lv)
        LayoutHelper.fillAndCentre(lv, margins: margins)
        // Error View
        let ev = ErrorView.create()
        nc.view.addSubview(ev)
        nc.view.bringSubview(toFront: ev)
        LayoutHelper.fillAndCentre(ev, margins: margins)
        // Hide both by default
        ev.isHidden = true
        lv.isHidden = true
        return (loading: lv, error: ev)
    }
}
