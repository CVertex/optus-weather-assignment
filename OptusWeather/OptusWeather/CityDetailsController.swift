//
//  ViewController.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

class CityDetailsController: UIViewController {
    
    var city: CityViewModel? {
        didSet {
            self.update()
        }
    }

    // Rows
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    
    // Label
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var visibilityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showRows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }

    // MARK: - Animation
    
    func showRows() {
        
        // Only animate if shown
        if !self.view2.isHidden {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.showRow(view: self.view2)
            self.showRow(view: self.view3)
            self.showRow(view: self.view4)
            self.showRow(view: self.view5)
            self.showRow(view: self.view6)
        }
    }
    
    func showRow(view: UIView) {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: [], animations: {
            view.alpha = 1.0
            view.isHidden = false
        }, completion: nil)
    }
    
    // MARK: - Update
    
    func update() {
        if !isViewLoaded {
            return
        }
        
        guard let city = self.city else {
            return
        }
        
        // Update name
        self.title = city.name
        self.cityLabel.text = city.name
        self.tempLabel.text = city.temperature
        self.conditionLabel.text = city.condition
        self.minTempLabel.text = city.temperatureMinimum
        self.maxTempLabel.text = city.temperatureMaximum
        self.sunriseLabel.text = city.sunrise
        self.sunsetLabel.text = city.sunset
        self.cloudsLabel.text = city.cloudiness
        self.rainLabel.text = city.rainVolume
        self.humidityLabel.text = city.humidity
        self.pressureLabel.text = city.pressure
        self.visibilityLabel.text = city.visibility
    }
}

