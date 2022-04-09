//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 09/04/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    
    var isFollowed: Bool? = false
    var isCurrentUser: Bool { AuthViewModel().userSession?.uid == id }
}
