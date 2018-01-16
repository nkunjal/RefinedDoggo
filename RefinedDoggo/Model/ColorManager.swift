//
//  File.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 1/8/18.
//  Copyright © 2018 Neha Kunjal. All rights reserved.
//

import CoreImage

class ColorControl: Brightness, Contrast {
    
    // MARK: - Properties
    
    let filter = CIFilter(name: "CIColorControls")!
}
