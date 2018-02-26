//
//  BrightnessViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/21/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class BrightnessViewController: UIViewController {
    var takenPhoto: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var brightnessSlider: UISlider!
    fileprivate var colorControl = ColorControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabView = self.tabBarController as! EditingTabViewController
        takenPhoto = tabView.takenPhoto
        if let availableImage = takenPhoto {
            imageView.image = availableImage
        }
        // Do any additional setup after loading the view.
        colorControl.input(imageView.image!)
        self.setUISLidersValues()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let tabView = self.tabBarController as! EditingTabViewController
        takenPhoto = tabView.takenPhoto
        if let availableImage = takenPhoto {
            imageView.image = availableImage
        }
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    fileprivate func setUISLidersValues() {
        brightnessSlider.value = colorControl.currentBrightnessValue
        brightnessSlider.maximumValue = colorControl.maxBrightnessValue
        brightnessSlider.minimumValue = colorControl.minBrightnessValue
    }

}
extension BrightnessViewController {
    
    @IBAction func brightnessUISliderPressed(_ sender: UISlider) {
        DispatchQueue.main.async {
            //self.brightnessLabel.text = "Brightness \(sender.value)"
            self.colorControl.brightness(sender.value)
            self.imageView.image = self.colorControl.outputUIImage()
            //let tabView = self.tabBarController as! EditingTabViewController
            (self.tabBarController as! EditingTabViewController).takenPhoto =  self.imageView.image
        }
    }
    
    
    
}
