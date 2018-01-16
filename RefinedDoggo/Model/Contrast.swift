//
//  Contrast.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 1/8/18.
//  Copyright © 2018 Neha Kunjal. All rights reserved.
//

import CoreImage

protocol Contrast: Process {
    var minContrastValue: Float { get }
    var maxContrastValue: Float { get }
    var currentContrastValue: Float { get }
    func contrast(_ contrast: Float)
}

extension Contrast {
    
    var minContrastValue: Float {
        return 0.00
    }
    
    var maxContrastValue: Float {
        return 4.00
    }
    
    var currentContrastValue: Float {
        return filter.value(forKey: kCIInputContrastKey) as? Float ?? 0.00
    }
    
    func contrast(_ contrast: Float) {
        self.filter.setValue(contrast, forKey: kCIInputContrastKey)
    }
}

