//
//  MainTabView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    let user: User
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView().tabItem { Image(systemName: "house") }
                SearchView().tabItem { Image(systemName: "magnifyingglass") }
                UploadPostView().tabItem { Image(systemName: "plus.square") }
                NotificationView().tabItem { Image(systemName: "heart") }
                ProfileView(user: user).tabItem { Image(systemName: "person") }
            }
            .accentColor(.black)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: logoutButton)
        }
    }
    
    var logoutButton: some View {
        Button {
            viewModel.signout()
        } label: {
            Text("Logout").foregroundColor(.black)
        }

    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
