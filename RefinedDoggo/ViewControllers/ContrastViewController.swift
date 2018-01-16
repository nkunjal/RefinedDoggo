//
//  ContrastViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/21/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class ContrastViewController: UIViewController {
    var takenPhoto: UIImage?
    //@IBOutlet var tabBar: EditingTabViewController!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var contrastSlider: UISlider!
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
        self.setUISLidersVal()
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


    fileprivate func setUISLidersVal() {
        contrastSlider.value = colorControl.currentContrastValue
        contrastSlider.maximumValue = colorControl.maxContrastValue
        contrastSlider.minimumValue = colorControl.minContrastValue
    }
}


// MARK: - UISlider @IBAction

extension ContrastViewController {
    
    @IBAction func contrastUISliderPressed(_ sender: UISlider) {
        DispatchQueue.main.async {
            //self.contrastLabel.text = "Contrast \(sender.value)"
            self.colorControl.contrast(sender.value)
            self.imageView.image = self.colorControl.outputUIImage()
            let tabView = self.tabBarController as! EditingTabViewController
            tabView.takenPhoto =  self.imageView.image
        }
    }

}
