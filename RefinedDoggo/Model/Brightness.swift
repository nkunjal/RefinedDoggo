//
//  Brightness.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 1/8/18.
//  Copyright © 2018 Neha Kunjal. All rights reserved.
//

import Foundation
import CoreImage

protocol Brightness: Process {
    var minBrightnessValue: Float { get }
    var maxBrightnessValue: Float { get }
    var currentBrightnessValue: Float { get }
    func brightness(_ brightness: Float)
}

extension Brightness {
    
    var minBrightnessValue: Float {
        return -1.00
    }
    
    var maxBrightnessValue: Float {
        return 1.00
    }
    
    var currentBrightnessValue: Float {
        return filter.value(forKey: kCIInputBrightnessKey) as? Float ?? 0.00
    }
    
    func brightness(_ brightness: Float) {
        self.filter.setValue(brightness, forKey: kCIInputBrightnessKey)
    }
}
