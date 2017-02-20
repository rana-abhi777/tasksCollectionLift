//
//  StackViewController.swift
//  TableViewSample
//
//  Created by cbl73 on 2/10/17.
//  Copyright © 2017 Codebrew. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    let imagePicker = UIImagePickerController()
    var selectedTag:Int = -1
    
    @IBOutlet var btnCollection: [UIButton]!
    @IBOutlet var imgViewCollection: [UIImageView]!
    {
        didSet{
            imgViewCollection.forEach{ imgView in
                imgView.image = #imageLiteral(resourceName: "sample-icon")
                imgView.contentMode = .scaleAspectFill
                imgView.clipsToBounds = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }
    
    
    @IBAction func btnClickAction(_ sender: UIButton) {
        
        selectedTag = sender.tag
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }

}

extension StackViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgViewCollection[selectedTag].image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
