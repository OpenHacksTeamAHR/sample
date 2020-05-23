//
//  InLocation.swift
//  OpenHacksProject
//
//  Created by Aster on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import Foundation

func vibrateTime(dist: Float) -> Float {
    if (dist>=12){
        return 0
    }
    return Float(pow(Double(1.2),Double(dist)))/6
}

