//
//  ThingsViewController.swift
//  ThingsCollector
//
//  Created by Viviana B.P on 9/4/17.
//  Copyright © 2017 vivbenpar. All rights reserved.
//

import UIKit

class ThingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var thingsImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        thingsImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
       
        let thing = Thing (context: context)
        thing.title = titleTextField.text
        thing.image = UIImagePNGRepresentation(thingsImageView.image!) as NSData?
        
    
        (UIApplication.shared.delegate as!
            AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
}
