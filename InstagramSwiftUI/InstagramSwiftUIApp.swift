//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 07/04/22.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}
