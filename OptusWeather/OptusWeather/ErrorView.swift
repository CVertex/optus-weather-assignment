//
//  ErrorView.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 27/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

public class ErrorViewContainer: NSObject {
    @IBOutlet var errorView: ErrorView!
}

public class ErrorView: UIView {
    @IBOutlet weak var retryButton: UIButton!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

public extension ErrorView {

    public static func create() -> ErrorView {
        let container = ErrorViewContainer()
        Bundle.main.loadNibNamed("ErrorView",
                                 owner: container,
                                 options: nil)
        return container.errorView
    }
}
