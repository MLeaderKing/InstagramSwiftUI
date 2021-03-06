//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 08/04/22.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [unowned self] result, error in
            if let error = error {
                print("Login failed \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            userSession = user
            fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullName: String, username: String) {
        guard let image = image else {
            return
        }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { [unowned self] result, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let user = result?.user else { return }
                userSession = user
                print("Successfully registered user")
                
                let data = ["email": email, "username": username, "fullname": fullName, "profileImageUrl": imageUrl, "uid": user.uid]
                
                COLLECTION_USER.collection("users").document(user.uid).setData(data) { [unowned self] _ in
                    userSession = user
                    fetchUser()
                    print("Successfully uploaded image")
                }
            }
        }
    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        COLLECTION_USER.collection("users").document(uid).getDocument { [weak self] snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self?.currentUser = user
        }
    }
}
