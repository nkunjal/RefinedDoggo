//
//  ReviewViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/21/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var takenPhoto: UIImage?
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
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

}
