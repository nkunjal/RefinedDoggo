//
//  PhotoViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/20/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var takenPhoto: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.tintColor = UIColor.blue
        if let availableImage = takenPhoto {
            imageView.image = availableImage
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

}
