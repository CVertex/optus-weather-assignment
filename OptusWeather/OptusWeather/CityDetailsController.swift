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
            // TODO: load view model
            print("Loaded City!!")
        }
    }

    /*
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
 */
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
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
}

