//
//  ImagePicker.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 15/9/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    var selectedSource: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Binding var isPickerVisible: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController{
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        if UIImagePickerController.isSourceTypeAvailable(selectedSource){
            imagePickerController.sourceType = selectedSource
        }
        
        return imagePickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.isPickerVisible = false
        }
    }
}
