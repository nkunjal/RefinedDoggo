//
//  Process.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 1/8/18.
//  Copyright © 2018 Neha Kunjal. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

protocol Process {
    
    var filter: CIFilter { get }
    func input(_ image: UIImage)
    func outputUIImage() -> UIImage?
}


extension Process {
    
    func input(_ image: UIImage) {
        if let cgImage = image.cgImage {
            
            let ciImage = CIImage(cgImage: cgImage)
            self.filter.setValue(ciImage, forKey: kCIInputImageKey)
        }
    }
}


extension Process {
    
    func outputUIImage() -> UIImage? {
        
        if let outputImage = self.filter.outputImage {
            let openGLContext = EAGLContext(api: .openGLES3)!
            let ciImageContext = CIContext(eaglContext: openGLContext)
            
            if let cgImageNew = ciImageContext.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImageNew)
            }
        }
        
        return nil
    }
}
