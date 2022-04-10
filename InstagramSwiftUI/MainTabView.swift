//
//  MainTabView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var selectedIndex: Int
    
    let user: User
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .onTapGesture { selectedIndex = 0 }
                    .tabItem { Image(systemName: "house") }
                    .tag(0)
                SearchView()
                    .onTapGesture { selectedIndex = 1 }
                    .tabItem { Image(systemName: "magnifyingglass") }
                    .tag(1)
                UploadPostView(selectedIndex: $selectedIndex)
                    .tabItem { Image(systemName: "plus.square") }
                    .onTapGesture { selectedIndex = 2 }
                    .tag(2)
                NotificationView()
                    .tabItem { Image(systemName: "heart") }
                    .onTapGesture { selectedIndex = 3 }
                    .tag(3)
                ProfileView(user: user)
                    .tabItem { Image(systemName: "person") }
                    .onTapGesture { selectedIndex = 4 }
                    .tag(4)
            }
            .accentColor(.black)
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: logoutButton)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
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
