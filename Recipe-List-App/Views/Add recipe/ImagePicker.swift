//
//  ImagePicker.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 15/9/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    var selectedSource: UIImagePickerController.SourceType
    func makeUIViewController(context: Context) -> UIImagePickerController{
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = selectedSource
        
        return imagePickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
