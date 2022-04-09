//
//  Constants.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 09/04/22.
//

import Foundation
import Firebase

let COLLECTION_USER = Firestore.firestore()
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
