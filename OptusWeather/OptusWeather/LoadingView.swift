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
        return container.loadingView
    }
}
