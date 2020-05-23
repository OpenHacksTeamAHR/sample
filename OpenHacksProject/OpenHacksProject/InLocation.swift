//
//  InLocation.swift
//  OpenHacksProject
//
//  Created by Aster on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import Foundation
import RadarSDK

func vibrateTime(dist: Float) -> Float {
    if (dist>=12){
        return 0
    }
    return Float(pow(Double(1.2),Double(dist)))/6
}

func distBetween(xone:Float, yone:Float, xtwo:Float, ytwo:Float) -> Float{
    return sqrtf((yone-ytwo)*(yone-ytwo)-(xone-xtwo)*(xone-xtwo))
}

