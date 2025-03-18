//
//  UpoladPhotoView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI
import PhotosUI

struct UploadPhotoView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var showConfirmationDialog = false
    @State private var showPhotoPicker = false
    
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        
        VStack {
            HStack {
                if let imageData = viewModel.selectedPhoto, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(50)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                } else {
                    Text(GeneralConstants.uploadYourPhoto.localized)
                        .font(Fonts.customBody16)
                        .foregroundStyle(viewModel.isPhotoValid ? Color.mainTextColor : Color.mainErrorColor)
                        .padding()
                }
                Spacer()
                Button(GeneralConstants.upload.localized) {
                    showConfirmationDialog = true
                }
                .padding()
                .confirmationDialog("Choose how you want to add a photo", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                            Button("Camera") { showCamera = true }
                            Button("Galery") { showPhotoPicker = true}
                            Button("Cancel", role: .cancel) { }
                        }
                .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images, photoLibrary: .shared())
                .onChange(of: selectedItem) { newItem in
                    if let item = newItem {
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    DispatchQueue.main.async {
                                        viewModel.selectedPhoto = data
                                        viewModel.validatePhoto()
                                    }
                                }
                            case .failure(let error):
                                print("Error loading image: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                .sheet(isPresented: $showCamera) {
                    ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                }
                .onChange(of: selectedImage) { newImage in
                    if let image = newImage {
                            DispatchQueue.main.async {
                                if let imageData = image.jpegData(compressionQuality: 0.8) {
                                    viewModel.selectedPhoto = imageData
                                    viewModel.validatePhoto()
                                }
                            }
                        }
                }
            }
            .frame(height: UIConstants.inputLabelHeight)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke( (viewModel.selectedPhoto == nil) ?
                             (viewModel.isSignUpButtonPressed
                              ? Color.mainDisableColor : Color.mainPrimaryColor)
                             : (viewModel.isPhotoValid ? Color.mainDisableColor
                                : Color.mainErrorColor ),
                             lineWidth: 1)
            )
            
            if viewModel.selectedPhoto == nil {
                if viewModel.isSignUpButtonPressed {
                    Text("Required field")
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    UploadPhotoView()
}
