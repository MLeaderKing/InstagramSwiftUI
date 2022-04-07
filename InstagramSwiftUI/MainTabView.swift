//
//  MainTabView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView().tabItem { Image(systemName: "house") }
                SearchView().tabItem { Image(systemName: "magnifyingglass") }
                UploadPostView().tabItem { Image(systemName: "plus.square") }
                NotificationView().tabItem { Image(systemName: "heart") }
                ProfileView().tabItem { Image(systemName: "person") }
            }
            .accentColor(.black)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
