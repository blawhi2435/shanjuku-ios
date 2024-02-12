//
//  CreateGroupView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/11.
//

import SwiftUI

struct CreateGroupView: View {
    @Environment(\.dismiss) var dismiss
    @State var groupName: String = ""
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    @State var groupImage: UIImage?
    @State  var isChosenPhoto: Bool = false
    
    var body: some View {
        NavigationStack {
            HStack {
                
                if let groupImage = self.groupImage {
                    
                    Image(uiImage: groupImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            self.showPhotoOptions = true
                        }
                    
                } else {
                    Color.photoGray
                        .frame(width: 55, height: 55)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])
                                    )
                                    .foregroundColor(.gray)
                                Image(systemName: "photo.badge.plus")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                            }
                            
                        }
                        .onTapGesture {
                            self.showPhotoOptions = true
                        }
                }
                
                
                FormText(placeholder: "Group name", value: $groupName)
            }
            .padding()
            .navigationTitle("Create a group")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color(Color.darkGreen))
                    }
                    .tint(.darkGreen)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundStyle(Color(Color.darkGreen))
                    }
                    .tint(.darkGreen)
                }
            }
            .confirmationDialog("Choose your photo source", isPresented: $showPhotoOptions, titleVisibility: .visible) {
                
                Button("Camera") {
                    self.photoSource = .camera
                }
                
                Button("Photo Library") {
                    self.photoSource = .photoLibrary
                }
            }
            .fullScreenCover(item: $photoSource) { source in
                switch source {
                case .photoLibrary: 
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $groupImage).ignoresSafeArea()
                case .camera:
                    ImagePicker(sourceType: .camera, selectedImage: $groupImage).ignoresSafeArea()
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    CreateGroupView()
}
