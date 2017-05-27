//
//  LoadingView.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 27/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit
import QuartzCore

public class LoadingViewContainer: NSObject {
    @IBOutlet var loadingView:LoadingView!
}

//@IBDesignable // <- to optionally enable live rendering in IB
public class LoadingView: UIView {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

public extension LoadingView {
    
    public static func create() -> LoadingView {
        let container = LoadingViewContainer()
        
        Bundle.main.loadNibNamed("LoadingView",
                                 owner: container,
                                 options: nil)
        
        // Tweak some visuals
        /*
        c.errorView.backgroundColor = StyleKitName.canvasColour().colorWithAlphaComponent(0.85)
        c.errorView.icon.image = c.errorView.icon.image!.imageWithRenderingMode(.AlwaysTemplate)
        c.errorView.icon.tintColor = UIColor.whiteColor()
        c.errorView.tryAgain.tintColor = UIColor.whiteColor()
        
        // Set text if supplied
        if let t = text {
            c.errorView.label.text = t
        }
         */
        return container.loadingView
    }
}
