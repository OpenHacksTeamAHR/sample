//
//  ViewController.swift
//  OpenHacksProject
//
//  Created by Rahul Rao on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit
import Firebase

    class ViewController: UIViewController {
        @IBOutlet weak var backgroundGradientView: UIView!
        var locationManager = CLLocationManager()
        override func viewDidLoad() {
           let locationManager = CLLocationManager()
           super.viewDidLoad()
           locationManager.requestWhenInUseAuthorization()
           var currentLoc: CLLocation!
           if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() == .authorizedAlways) {
              currentLoc = locationManager.location
              print(currentLoc.coordinate.latitude)
              print(currentLoc.coordinate.longitude)
           }
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
            gradientLayer.shouldRasterize = true
            backgroundGradientView.layer.addSublayer(gradientLayer)
        }
        
        
        override var shouldAutorotate: Bool {
            return false
        }
        
 
}

