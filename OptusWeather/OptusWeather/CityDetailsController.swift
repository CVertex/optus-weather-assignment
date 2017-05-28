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

    /*
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
 */
    
    // Rows
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
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
        
        
        //self.view1.isHidden = true
        //self.view2.isHidden = true
        //self.view3.isHidden = true
        
        let dur:TimeInterval = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
        
            print("Let's go show everything!")
            
            UIView.animate(withDuration: dur, animations: {
                self.view2.isHidden = false
            }) { finished in
                 UIView.animate(withDuration: dur, animations: {
                    self.view3.isHidden = false
                 }) { finished in
                    
                    UIView.animate(withDuration: dur, animations: {
                        //self.view3.isHidden = false
                    }) { finished in
                        print("Showing complete")
                    }
                 }
            }
        }
        
        
        
        /*
        self.label1.isHidden = true
        self.label2.isHidden = true
        self.label3.isHidden = true
        self.label4.isHidden = true
        self.label5.isHidden = true
        let dur:TimeInterval = 0.3
        
        UIView.animate(withDuration: dur, animations: {
            self.label1.isHidden = false
        }) { finished in
        
            UIView.animate(withDuration: dur, animations: {
                self.label2.isHidden = false
            }) { finished in
                UIView.animate(withDuration: dur, animations: {
                    self.label3.isHidden = false
                }) { finished in
                    
                    UIView.animate(withDuration: dur, animations: {
                        self.label4.isHidden = false
                    }) { finished in
                        
                        UIView.animate(withDuration: dur, animations: {
                            self.label5.isHidden = false
                        }) { finished in
                        }
                    }
                }
            }
        }
        
        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        update()
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
        
        // TODO Animate to present
        
    }
}

