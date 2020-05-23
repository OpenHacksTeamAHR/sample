//
//  ViewController.swift
//  OpenHacksProject
//
//  Created by Rahul Rao on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.layer.cornerRadius = myButton.frame.size.height/2
        myButton.layer.masksToBounds = true
        
        view.setGradientBackground(colorOne: Colors.blue, colortwo: Colors.red)
    }
}
