//
//  CameraController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/17/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import Foundation
class CameraController { }
func prepare(completionHandler: @escaping (Error?) -> Void) {
    func createCaptureSession() { }
    func configureCaptureDevices() throws { }
    func configureDeviceInputs() throws { }
    func configurePhotoOutput() throws { }
    
    DispatchQueue(label: "prepare").async {
        do {
            createCaptureSession()
            try configureCaptureDevices()
            try configureDeviceInputs()
            try configurePhotoOutput()
        }
            
        catch {
            DispatchQueue.main.async {
                completionHandler(error)
            }
            
            return
        }
        
        DispatchQueue.main.async {
            completionHandler(nil)
        }
    }
}
