//
//  UserListView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 01/04/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { _ in
                    NavigationLink(destination: ProfileView()) {
                        UserCellView()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct UserCellView: View {
    var body: some View {
        HStack {
            Image("venom")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .clipped()
            
            VStack(alignment: .leading) {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Bruce Wayne")
                    .font(.system(size: 14))

            }
            
            Spacer()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
