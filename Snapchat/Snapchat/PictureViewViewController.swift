//
//  PictureViewViewController.swift
//  Snapchat
//
//  Created by Lois Talagrand on 5/22/17.
//  Copyright © 2017 Lois Talagrand. All rights reserved.
//

import UIKit
import Firebase

class PictureViewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    
    }

    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imagesFolder = Storage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        
        
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil) { (metadata, error) in
            print("We tried to upload")
            if(error != nil) {
                print("We have an error \(error)")
            } else {
                print("Stored image succefully at: ")
                print(metadata?.downloadURL())
                self.performSegue(withIdentifier: "selectUsersSegue", sender: nil)
            }
        }

    }
    
    // Store the image in Firebase
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
