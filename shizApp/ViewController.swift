//
//  ViewController.swift
//  shizApp
//
//  Created by Shizuka on 2019/06/22.
//  Copyright © 2019 shizuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional s	etup after loading the view.
    }

    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        let pickerController = UIImagePickerController()

        pickerController.sourceType = .photoLibrary

        pickerController.delegate = self

        present(pickerController, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage

        imageView.image = image

        analyzeImage(image)
        
        self.dismiss(animated: true)
    }
    
    func analyzeImage(_ image: UIImage) {

        // URL
        let apiKey: String = "Set your_API_token here."
        let urlString = "https://vision.googleapis.com/v1/images:annotate?key=\(apiKey)"

        //image
        let data = image.jpegData(compressionQuality: 1.0)
        let dataString = data?.base64EncodedString()

        let jsonObject =
        [
            "requests": [
                "image": [
                    "content": dataString ?? "n/a"
                ],
                "features": [
                    "type": "TEXT_DETECTION",
                    "maxResults": 10
                ]
            ]
        ]
        
        // Client
        let urlSessionPostClient = URLSessionPostClient()

        resultLabel.text = urlSessionPostClient.post(url: urlString, parameters: jsonObject)
        
    }
    
}

