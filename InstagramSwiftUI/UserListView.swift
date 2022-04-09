//
//  UserListView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 01/04/22.
//

import SwiftUI
import Kingfisher

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsrs(searchText), id: \.id) { user in
                    NavigationLink(destination: ProfileView(user: user)) {
                        UserCellView(user: user)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .clipped()
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))

            }
            
            Spacer()
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
