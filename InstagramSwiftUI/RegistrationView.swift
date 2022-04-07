//
//  RegistrationView.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 07/04/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var imagePickerPresented = false

    @Environment(\.presentationMode) var mode
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    if let image = postImage {
                        image
                            .resizable()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .padding(.top)
                    } else {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            Image("plus_photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top)
                        }
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }

                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.top)
                    CustomTextField(text: $userName, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.horizontal])

                    
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()

                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Ip")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom)
                    }
                }
                .navigationBarHidden(true)
            }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
