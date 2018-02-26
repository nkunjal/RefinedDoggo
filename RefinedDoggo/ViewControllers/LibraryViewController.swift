//
//  LibraryViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/16/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet var pickerImage: UIImageView!
    let picViewerController = UIImagePickerController()
    var isSeen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picViewerController.delegate = self;
        isSeen = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (isSeen) {
        picViewerController.allowsEditing = false
        picViewerController.sourceType = .photoLibrary
        picViewerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picViewerController.modalPresentationStyle = .popover
        present(picViewerController, animated: true, completion: nil)
        }
        else {
            isSeen = true
        }
        //

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("entered")
            pickerImage.image = picker
            //self.performSegue(withIdentifier: "photoPicked", sender: picker)
            isSeen = false
        }
        dismiss(animated: true, completion: nil )
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil )
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotoViewController {
            destination.takenPhoto = sender as? UIImage
            isSeen = false
        }
        
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
