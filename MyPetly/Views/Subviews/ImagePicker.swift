//
//  ImagePicker.swift
//  MyPetly
//
//  Created by Ali on 17.12.2023.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageSelected: UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) { }
        
        func makeCoordinator() -> ImagePickerCoordinator {
            return ImagePickerCoordinator(parent: self)
        }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                
                // uygulamanın resmini seç
                parent.imageSelected = image
                
                // fotoğraf yüklendikten sonra ekranı kapat
                parent.presentationMode.wrappedValue.dismiss()
                
            }
        }
        
    }
    
}
